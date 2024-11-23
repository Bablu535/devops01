<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mobile Recommendation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
        }
        .recommendation {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mobile Recommendation</h1>
        <form id="mobileForm">
            <label for="ram">Select RAM Capacity:</label>
            <select id="ram">
                <option value="4GB">4GB</option>
                <option value="6GB">6GB</option>
                <option value="8GB">8GB</option>
                <option value="12GB">12GB</option>
            </select>

            <label for="graphics">Select Graphics Card:</label>
            <select id="graphics">
                <option value="Basic">Basic</option>
                <option value="Standard">Standard</option>
                <option value="High-End">High-End</option>
            </select>

            <label for="camera">Select Camera Quality:</label>
            <select id="camera">
                <option value="12MP">12MP</option>
                <option value="48MP">48MP</option>
                <option value="64MP">64MP</option>
                <option value="108MP">108MP</option>
            </select>

            <button type="button" onclick="recommendMobile()">Get Recommendation</button>
        </form>

        <div id="recommendation" class="recommendation" style="display: none;"></div>
    </div>

    <script>
        function recommendMobile() {
            const ram = document.getElementById('ram').value;
            const graphics = document.getElementById('graphics').value;
            const camera = document.getElementById('camera').value;

            let recommendations = [];

            // Sample recommendations based on input
            if (ram === '4GB' && graphics === 'Basic' && camera === '12MP') {
                recommendations.push('Samsung Galaxy A12', 'Redmi 9');
            } else if (ram === '6GB' && graphics === 'Standard' && camera === '48MP') {
                recommendations.push('Realme 8', 'Poco X3');
            } else if (ram === '8GB' && graphics === 'High-End' && camera === '64MP') {
                recommendations.push('OnePlus Nord 2', 'Samsung Galaxy M52');
            } else if (ram === '12GB' && graphics === 'High-End' && camera === '108MP') {
                recommendations.push('Samsung Galaxy S21 Ultra', 'Xiaomi Mi 11 Ultra');
            } else {
                recommendations.push('No exact match found. Consider adjusting your criteria.');
            }

            const recommendationDiv = document.getElementById('recommendation');
            recommendationDiv.style.display = 'block';
            recommendationDiv.innerHTML = `<h3>Recommended Mobiles:</h3><ul>${recommendations.map(mobile => `<li>${mobile}</li>`).join('')}</ul>`;
        }
    </script>
</body>
</html>
