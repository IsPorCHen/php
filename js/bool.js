function showElement(htmlContent) {
    const resultsContainer = document.querySelector('.results');
    resultsContainer.innerHTML = htmlContent;
}

function showMessage(message, isError = false) {
    let messageBox = document.querySelector('.message-box');
    
    if (messageBox) {
        messageBox.remove();
    }

    messageBox = document.createElement('div');
    messageBox.className = 'message-box';
    messageBox.style.position = 'fixed';
    messageBox.style.top = '20px';
    messageBox.style.left = '50%';
    messageBox.style.transform = 'translateX(-50%)';
    messageBox.style.padding = '10px 20px';
    messageBox.style.backgroundColor = isError ? '#ff4c4c' : '#4caf50';
    messageBox.style.color = 'white';
    messageBox.style.borderRadius = '5px';
    messageBox.style.zIndex = '1000';
    messageBox.textContent = message;

    document.body.appendChild(messageBox);

    setTimeout(() => {
        messageBox.remove();
    }, 3000);
}

function handleFormSubmit(event) {
    event.preventDefault();

    const form = document.querySelector('form');
    const formData = new FormData(form);

    fetch('../php/search.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(htmlContent => {
        if (htmlContent.includes('Книги не найдены')) {
            showMessage('Книги не найдены', true);
        } else {
            showElement(htmlContent);
        }
    })
    .catch(() => {
        showMessage('Ошибка при выполнении запроса', true);
    });
}

window.onload = function() {
    const form = document.querySelector('form');
    form.addEventListener('submit', handleFormSubmit);
};
