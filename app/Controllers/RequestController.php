<?php
// English: File updated at: app/Controllers/RequestController.php

namespace App\Controllers;

use App\Models\RequestModel;
use App\Services\TMDbService; // Import TMDbService for live search

class RequestController
{
    /**
     * Displays the content request page, showing a form and the user's past requests.
     */
    public function index()
    {
        if (!isset($_SESSION['user_id']) || !isset($_SESSION['profile_id'])) {
            header('Location: /login');
            exit;
        }

        $requestModel = new RequestModel();
        $requests = $requestModel->findByProfileId($_SESSION['profile_id']);

        view('requests', [
            'title' => 'Make a Request',
            'pageTitle' => 'Request Content',
            'requests' => $requests
        ]);
    }

    /**
     * --- CORRECTED FUNCTION ---
     * Handles the AJAX submission of a new content request and returns JSON.
     */
    public function store()
    {
    header('Content-Type: application/json');

    if (!isset($_SESSION['user_id']) || !isset($_SESSION['profile_id'])) {
        echo json_encode(['status' => 'error', 'message' => 'You must be logged in to make a request.']);
        exit;
    }

    $data = [
        'user_id'    => $_SESSION['user_id'],
        'profile_id' => $_SESSION['profile_id'],
        'title'      => trim($_POST['title'] ?? ''),
        'type'       => $_POST['type'] ?? 'movie',
        'poster_path' => $_POST['poster_path'] ?? null // <-- YENİ: poster_path'i al
    ];

    if (empty($data['title'])) {
        echo json_encode(['status' => 'error', 'message' => 'Request title cannot be empty.']);
        exit;
    }

    $requestModel = new RequestModel();
    if ($requestModel->create($data)) {
        echo json_encode(['status' => 'success', 'message' => 'Request submitted successfully!']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'There was an error submitting your request.']);
    }
    exit;
    }

    /**
     * Handles live search requests by querying the TMDb API.
     */
    public function searchTMDb()
    {
        header('Content-Type: application/json');

        $query = $_GET['q'] ?? '';

        if (empty($query)) {
            echo json_encode(['results' => []]);
            exit;
        }

        $tmdbService = new TMDbService();
        $results = $tmdbService->searchMulti($query);

        $filteredResults = [];
        if (!empty($results['results'])) {
            foreach ($results['results'] as $item) {
                if (($item['media_type'] === 'movie' || $item['media_type'] === 'tv') && !empty($item['poster_path'])) {
                    $filteredResults[] = [
                        'id' => $item['id'],
                        'title' => $item['title'] ?? $item['name'],
                        'poster_path' => $item['poster_path'],
                        'type' => $item['media_type'] === 'tv' ? 'tv_show' : 'movie'
                    ];
                }
            }
        }

        echo json_encode(['results' => $filteredResults]);
        exit;
    }
}