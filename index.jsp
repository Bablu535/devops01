<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phone Recommendations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .disclaimer {
            text-align: center;
            padding: 10px;
            background-color: #ffc107;
            color: #333;
            font-size: 14px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
        .recommendations {
            margin-top: 20px;
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 5px;
            color: #333;
        }
        .recommendation-item {
            margin-bottom: 15px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .recommendation-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Phone Recommendations</h1>
        <div class="disclaimer">
            <strong>GET YOUR VIBE ON THE SMARTPHONE</strong>
        </div>
        <form id="phoneForm">
            <label for="ram">RAM Capacity (GB)</label>
            <select id="ram">
                <option value="4">4GB</option>
                <option value="6">6GB</option>
                <option value="8">8GB</option>
                <option value="12">12GB</option>
            </select>

            <label for="rom">ROM Capacity (GB)</label>
            <select id="rom">
                <option value="64">64GB</option>
                <option value="128">128GB</option>
                <option value="256">256GB</option>
                <option value="512">512GB</option>
            </select>

            <label for="graphics">Graphics Requirement</label>
            <select id="graphics">
                <option value="basic">Basic</option>
                <option value="intermediate">Intermediate</option>
                <option value="high">High</option>
            </select>

            <label for="camera">Camera Megapixels</label>
            <input type="number" id="camera" placeholder="Enter camera MP" min="1">

            <button type="button" onclick="getRecommendations()">Get Recommendations</button>
        </form>

        <div id="recommendations" class="recommendations"></div>
    </div>

    <script>
        function getRecommendations() {
            const ram = parseInt(document.getElementById("ram").value, 10);
            const rom = parseInt(document.getElementById("rom").value, 10);
            const graphics = document.getElementById("graphics").value.toLowerCase();
            const camera = parseInt(document.getElementById("camera").value, 10) || 0;

            const recommendations = document.getElementById("recommendations");
            recommendations.innerHTML = ""; // Clear previous results

            // List of phones with specifications
            const phoneList = [
                { name: "Samsung Galaxy S21 Ultra", ram: 12, rom: 512, graphics: "high", camera: 108 },
                { name: "iPhone 14 Pro Max", ram: 6, rom: 512, graphics: "high", camera: 48 },
                { name: "Google Pixel 7 Pro", ram: 12, rom: 256, graphics: "high", camera: 50 },
                { name: "OnePlus 11", ram: 16, rom: 256, graphics: "high", camera: 50 },
                { name: "Xiaomi Mi 11 Ultra", ram: 12, rom: 256, graphics: "high", camera: 50 },
                { name: "Samsung Galaxy A52", ram: 6, rom: 128, graphics: "intermediate", camera: 64 },
                { name: "iPhone 13", ram: 4, rom: 128, graphics: "intermediate", camera: 12 },
                { name: "Realme GT 2 Pro", ram: 8, rom: 256, graphics: "high", camera: 50 }
            ];

            // Filter phones based on user input
            const filteredPhones = phoneList.filter(phone =>
                phone.ram >= ram &&
                phone.rom >= rom &&
                phone.graphics === graphics &&
                phone.camera >= camera
            );

            // Generate HTML output for recommendations
            if (filteredPhones.length > 0) {
                let output = "<h3>Recommended Phones:</h3>";
                output += "<ul>";
                filteredPhones.forEach(phone => {
                    console.log(phone);
                    output += `<li><strong>${phone.name}</strong><br>RAM: ${phone.ram}GB, ROM: ${phone.rom}GB, Camera: ${phone.camera}MP, Graphics: ${phone.graphics}</li>`;
                });
                output += "</ul>";
                recommendations.innerHTML = output;
            } else {
                recommendations.innerHTML = "<h3>No phones match your criteria. Try adjusting your filters.</h3>";
            }
        }
    </script>

</body>
</html>
