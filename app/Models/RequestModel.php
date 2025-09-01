<?php
// English: File updated at: app/Models/RequestModel.php

namespace App\Models;

use PDO;
use PDOException;

// The RequestModel now extends BaseModel to inherit the stable PDO connection.
class RequestModel extends BaseModel
{
    /**
     * Creates a new content request in the database, linked to a user and profile.
     *
     * @param array $data The request data.
     * @return bool True on success, false on failure.
     */
    public function create($data)
    {
    try {
        // SQL sorgusuna poster_path sütununu ekliyoruz
        $sql = "INSERT INTO requests (user_id, profile_id, title, type, poster_path, status) 
                VALUES (?, ?, ?, ?, ?, 'pending')";
        
        $stmt = $this->pdo->prepare($sql);
        
        // Execute edilecek parametrelere poster_path'i ekliyoruz
        $success = $stmt->execute([
            $data['user_id'],
            $data['profile_id'],
            $data['title'],
            $data['type'],
            $data['poster_path'] // <-- YENİ: poster_path parametresi
        ]);

        if ($success) {
            $this->pdo->commit();
        }

        return $success;

    } catch (PDOException $e) {
        if ($this->pdo->inTransaction()) {
            $this->pdo->rollBack();
        }
        // Geliştirme aşamasında hatayı görmek için: error_log($e->getMessage());
        return false;
    }
     }

    /**
     * --- THE MISSING FUNCTION IS HERE ---
     * Finds all requests made by a specific profile.
     * This is what runs when you refresh the page.
     *
     * @param int $profileId The ID of the profile.
     * @return array An array of requests.
     */
    public function findByProfileId($profileId)
    {
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM requests WHERE profile_id = ? ORDER BY created_at DESC");
            $stmt->execute([$profileId]);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            return [];
        }
    }
    
    // --- Existing Admin Panel Functions (Now using stable PDO connection) ---

    public function getAllRequestsWithUsers()
    {
        try {
            $sql = "SELECT r.*, u.username, p.name as profile_name 
                    FROM requests r
                    LEFT JOIN users u ON r.user_id = u.id
                    LEFT JOIN profiles p ON r.profile_id = p.id
                    ORDER BY r.created_at DESC";
            $stmt = $this->pdo->query($sql);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            return [];
        }
    }

    public function updateStatus($id, $status)
    {
        try {
            $stmt = $this->pdo->prepare("UPDATE requests SET status = ? WHERE id = ?");

            // --- AYNI DEĞİŞİKLİK BURADA DA YAPILMALI ---
            $success = $stmt->execute([$status, $id]);

            if ($success) {
                // Bu satır burada da eksik olabilir.
                $this->pdo->commit();
            }
            
            return $success;
            // --- DEĞİŞİKLİK SONU ---

        } catch (PDOException $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }
            return false;
        }
    }
}