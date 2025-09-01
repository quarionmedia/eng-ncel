<?php require_once __DIR__ . '/partials/header.php'; ?>

<style>
    /* English: Styles for the modern requests page */
    .requests-container {
        max-width: 1200px;
        margin: 100px auto;
        padding: 40px;
        background: #1a1a1a;
        border-radius: 8px;
        border: 1px solid #303030;
    }
    .requests-container h1 {
        text-align: center;
        margin-bottom: 10px;
        color: #fff;
    }
    .requests-container .sub-text {
        text-align: center;
        color: #aaa;
        margin-bottom: 25px;
    }

    /* Search Bar */
    .search-bar-container {
        position: relative;
        margin-bottom: 30px;
    }
    #tmdb-search-input {
        width: 100%;
        padding: 15px 20px;
        background: #333;
        border: 1px solid #555;
        color: #fff;
        border-radius: 4px;
        font-size: 1.1rem;
    }
    #search-spinner {
        position: absolute;
        right: 15px;
        top: 15px;
        display: none; /* Hidden by default */
        border: 4px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        border-top: 4px solid #42ca1a;
        width: 20px;
        height: 20px;
        animation: spin 1s linear infinite;
    }
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Search Results Grid */
    #search-results {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }
    .result-item {
        position: relative;
        background: #2a2a2a;
        border-radius: 4px;
        overflow: hidden;
        transition: transform 0.2s ease;
    }
    .result-item:hover {
        transform: scale(1.05);
        z-index: 10;
    }
    .result-item img {
        width: 100%;
        height: auto;
        display: block;
    }
    .request-btn {
        position: absolute;
        top: 8px;
        right: 8px;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: rgba(0,0,0,0.7);
        color: #fff;
        border: 1px solid #fff;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        transition: all 0.2s ease;
    }
    .request-btn:hover {
        background: #fff;
        color: #000;
    }
    .request-btn.requested {
        background: #42ca1a;
        color: #fff;
        border-color: #42ca1a;
        cursor: not-allowed;
    }

    /* Past Requests List */
    .past-requests h2 {
        border-top: 1px solid #303030;
        padding-top: 30px;
        margin-bottom: 20px;
    }
    .request-list-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border-bottom: 1px solid #303030;
    }
    .request-list-item:last-child {
        border-bottom: none;
    }
    .status-badge {
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
        text-transform: capitalize;
    }
    .status-pending { background: #f0ad4e; color: #000; }
    .status-approved { background: #5cb85c; color: #fff; }
    .status-rejected { background: #d9534f; color: #fff; }

    /* --- NEW: Toast Popup Notification --- */
    #toast-notification {
        position: fixed;
        bottom: -100px; /* Initially hidden */
        left: 50%;
        transform: translateX(-50%);
        background-color: #42ca1a;
        color: #fff;
        padding: 15px 25px;
        border-radius: 8px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        z-index: 10000;
        font-weight: bold;
        transition: bottom 0.5s ease-in-out;
    }
    #toast-notification.show {
        bottom: 30px; /* Slide in from bottom */
    }
</style>

<div class="requests-container">
    <h1>Request Content</h1>
    <p class="sub-text">Can't find what you're looking for? Search below to request a new movie or TV show.</p>

    <div class="search-bar-container">
        <input type="text" id="tmdb-search-input" placeholder="Search for a movie or TV show...">
        <div id="search-spinner"></div>
    </div>

    <div id="search-results">
        </div>

    <div class="past-requests">
        <h2>Your Past Requests</h2>
        <div id="request-list">
            <?php if (!empty($requests)): ?>
                <?php foreach ($requests as $request): ?>
                    <div class="request-list-item" data-title="<?php echo htmlspecialchars($request['title']); ?>">
                        <span><?php echo htmlspecialchars($request['title']); ?></span>
                        <span class="status-badge status-<?php echo strtolower($request['status']); ?>">
                            <?php echo htmlspecialchars($request['status']); ?>
                        </span>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p id="no-requests-message">You haven't made any requests yet.</p>
            <?php endif; ?>
        </div>
    </div>
</div>

<div id="toast-notification"></div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('tmdb-search-input');
    const resultsContainer = document.getElementById('search-results');
    const spinner = document.getElementById('search-spinner');
    const requestList = document.getElementById('request-list');
    const noRequestsMessage = document.getElementById('no-requests-message');
    const toast = document.getElementById('toast-notification');
    let searchTimeout;

    // --- Live Search from TMDb ---
    searchInput.addEventListener('keyup', function() {
        clearTimeout(searchTimeout);
        const query = this.value;

        if (query.length < 3) {
            resultsContainer.innerHTML = '';
            return;
        }

        spinner.style.display = 'block';

        searchTimeout = setTimeout(() => {
            fetch(`/api/tmdb/search?q=${encodeURIComponent(query)}`)
                .then(response => response.json())
                .then(data => {
                    spinner.style.display = 'none';
                    resultsContainer.innerHTML = ''; // Clear previous results
                    if (data.results && data.results.length > 0) {
                        data.results.forEach(item => {
                            // ================== DEĞİŞİKLİK BURADA ==================
                            // Butona poster yolu ve tmdb id'si için data öznitelikleri eklendi
                            const resultItem = `
                                <div class="result-item">
                                    <img src="https://image.tmdb.org/t/p/w500${item.poster_path}" alt="${item.title}">
                                    <button class="request-btn" 
                                            data-title="${item.title}" 
                                            data-type="${item.type}"
                                            data-poster-path="${item.poster_path}"
                                            title="Request this content">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            `;
                            // ========================================================
                            resultsContainer.innerHTML += resultItem;
                        });
                    } else {
                        resultsContainer.innerHTML = '<p>No results found.</p>';
                    }
                })
                .catch(error => {
                    spinner.style.display = 'none';
                    console.error('Search Error:', error);
                });
        }, 500);
    });

    // --- Handle Request Button Click ---
    resultsContainer.addEventListener('click', function(e) {
        const targetButton = e.target.closest('.request-btn');
        if (targetButton && !targetButton.disabled) {
            e.preventDefault();

            // ================== DEĞİŞİKLİK BURADA ==================
            // Butondaki data özniteliklerinden yeni veriler okundu
            const title = targetButton.dataset.title;
            const type = targetButton.dataset.type;
            const posterPath = targetButton.dataset.posterPath;

            targetButton.disabled = true;
            targetButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';

            // Form datasına yeni veriler eklendi
            const formData = new FormData();
            formData.append('title', title);
            formData.append('type', type);
            formData.append('poster_path', posterPath);
            // ========================================================

            // Send the request in the background using fetch
            fetch('/requests/store', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.redirected) {
                    return { status: 'success' };
                }
                return response.json();
            })
            .then(data => {
                targetButton.innerHTML = '<i class="fas fa-check"></i>';
                targetButton.classList.add('requested');
                showToast(`'${title}' has been requested!`);

                if (noRequestsMessage) {
                    noRequestsMessage.remove();
                }
                const newRequestItem = `
                    <div class="request-list-item" data-title="${title}">
                        <span>${title}</span>
                        <span class="status-badge status-pending">pending</span>
                    </div>
                `;
                requestList.insertAdjacentHTML('afterbegin', newRequestItem);

            })
            .catch(error => {
                console.error('Request Error:', error);
                showToast('An error occurred. Please try again.');
                targetButton.disabled = false;
                targetButton.innerHTML = '<i class="fas fa-plus"></i>';
            });
        }
    });

    // --- Toast Popup Function ---
    function showToast(message) {
        toast.textContent = message;
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }
});
</script>

<?php require_once __DIR__ . '/partials/footer.php'; ?>