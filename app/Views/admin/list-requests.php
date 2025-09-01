<?php require_once __DIR__ . '/partials/header.php'; ?>

<style>
    .request-list {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    .request-item {
        background-color: #2a2a2a;
        padding: 15px;
        border-radius: 8px; /* Köşeleri biraz daha yuvarlak yaptım */
        display: flex;
        align-items: center;
        gap: 20px; /* Boşluğu artırdım */
    }
    /* YENİ: Poster stilleri */
    .request-poster {
        width: 60px; /* Poster genişliği */
        height: 90px; /* Poster yüksekliği */
        border-radius: 4px;
        object-fit: cover; /* Resmi alana sığdır */
        background-color: #333; /* Resim yoksa arkaplan rengi */
    }
    .request-info {
        flex-grow: 1;
    }
    .request-info h3 {
        margin: 0 0 5px 0;
        font-size: 1.1rem; /* Yazı boyutu biraz büyüdü */
    }
    .request-info p {
        margin: 0;
        font-size: 14px;
        color: #ccc;
    }
    .request-info small {
        color: #888;
        font-size: 0.8rem;
    }
    .request-actions {
        display: flex;
        align-items: center;
        gap: 15px;
        flex-shrink: 0; /* Daralmasını engelle */
    }
    .status-badge {
        padding: 4px 10px;
        border-radius: 15px;
        font-size: 12px;
        font-weight: bold;
        text-transform: capitalize;
    }
    .status-pending {
        background-color: #e67e22;
        color: #fff;
    }
    .status-approved {
        background-color: #27ae60;
        color: #fff;
    }
    .status-rejected {
        background-color: #c0392b;
        color: #fff;
    }
    .action-link {
        color: #a0aec0;
        text-decoration: none;
        font-size: 18px; /* İkonlar için */
        transition: color 0.2s;
    }
    .action-link:hover {
        color: #fff;
    }
</style>

<main>
    <h1>Request Management</h1>
    <p>Review and manage user-submitted content requests.</p>
    <hr style="border-color: #374151; margin: 20px 0;">

    <div class="request-list">
        <?php if (!empty($requests)): ?>
            <?php foreach ($requests as $request): ?>
                <div class="request-item">
                    <img src="<?php echo !empty($request['poster_path']) ? 'https://image.tmdb.org/t/p/w92' . $request['poster_path'] : '/assets/images/placeholder.png'; ?>" 
                         alt="Poster" 
                         class="request-poster">

                    <div class="request-info">
                        <h3><?php echo htmlspecialchars($request['title']); ?> <small>(<?php echo htmlspecialchars($request['type']); ?>)</small></h3>
                        <small>
                            Requested by: <?php echo htmlspecialchars($request['username'] ?? 'N/A'); ?> 
                            (Profile: <?php echo htmlspecialchars($request['profile_name'] ?? 'N/A'); ?>) 
                            on <?php echo date('Y-m-d', strtotime($request['created_at'])); ?>
                        </small>
                    </div>
                    <div class="request-actions">
                        <span class="status-badge status-<?php echo strtolower($request['status']); ?>"><?php echo htmlspecialchars($request['status']); ?></span>
                        
                        <?php if ($request['status'] == 'pending'): ?>
                            <a href="/admin/requests/update-status/<?php echo $request['id']; ?>/approved" class="action-link" title="Mark as Approved">✔</a>
                            <a href="/admin/requests/update-status/<?php echo $request['id']; ?>/rejected" class="action-link" title="Mark as Rejected">✖</a>
                        <?php endif; ?>
                        
                        <a href="/admin/requests/delete/<?php echo $request['id']; ?>" class="action-link" title="Delete Request" onclick="return confirm('Are you sure?');">🗑️</a>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No requests found.</p>
        <?php endif; ?>
    </div>
</main>
    
<?php require_once __DIR__ . '/partials/footer.php'; ?>