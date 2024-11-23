<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phone Recommendations</title>
    <style>
        .recommendation-item {
            margin: 5px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <!-- Input fields for filter criteria -->
    <div>
        <label>RAM (GB): <input type="number" id="ramInput" value="8"></label><br>
        <label>ROM (GB): <input type="number" id="romInput" value="128"></label><br>
        <label>Graphics: 
            <select id="graphicsInput">
                <option value="high">High</option>
                <option value="intermediate">Intermediate</option>
            </select>
        </label><br>
        <label>Camera (MP): <input type="number" id="cameraInput" value="50"></label><br>
        <button onclick="filterPhones()">Filter Phones</button>
    </div>

    <!-- Container for displaying recommendations -->
    <div id="recommendations"></div>

    <script>
        // Sample data: List of phones
        const phoneList = [
            { name: "Samsung Galaxy S21 Ultra", ram: 12, rom: 512, graphics: "high", camera: 108 },
            { name: "iPhone 14 Pro Max", ram: 6, rom: 512, graphics: "high", camera: 48 },
            { name: "Google Pixel 7 Pro", ram: 12, rom: 256, graphics: "high", camera: 50 },
            { name: "OnePlus 11", ram: 16, rom: 256, graphics: "high", camera: 50 },
            { name: "Xiaomi Mi 11 Ultra", ram: 12, rom: 256, graphics: "high", camera: 50 },
            { name: "Oppo Find X5 Pro", ram: 12, rom: 512, graphics: "high", camera: 50 },
            { name: "Sony Xperia 1 IV", ram: 12, rom: 512, graphics: "high", camera: 12 },
            { name: "Samsung Galaxy A52", ram: 6, rom: 128, graphics: "intermediate", camera: 64 },
            { name: "iPhone 13", ram: 4, rom: 128, graphics: "intermediate", camera: 12 },
            { name: "Realme GT 2 Pro", ram: 8, rom: 256, graphics: "high", camera: 50 },
            { name: "Asus ROG Phone 6", ram: 16, rom: 512, graphics: "high", camera: 50 },
            { name: "Vivo X80 Pro", ram: 12, rom: 256, graphics: "high", camera: 50 },
            { name: "Motorola Edge 30 Ultra", ram: 12, rom: 256, graphics: "high", camera: 200 },
            { name: "Xiaomi Redmi Note 12 Pro", ram: 8, rom: 128, graphics: "intermediate", camera: 108 },
            { name: "Poco F4 GT", ram: 12, rom: 256, graphics: "high", camera: 64 },
            { name: "Samsung Galaxy Z Fold 4", ram: 12, rom: 512, graphics: "high", camera: 50 },
            { name: "OnePlus Nord 2T", ram: 8, rom: 128, graphics: "intermediate", camera: 50 },
            { name: "Realme Narzo 50 Pro", ram: 6, rom: 128, graphics: "intermediate", camera: 48 },
            { name: "Sony Xperia 5 IV", ram: 8, rom: 128, graphics: "high", camera: 12 },
            { name: "Huawei Mate 50 Pro", ram: 8, rom: 512, graphics: "high", camera: 50 }
        ];

        // Function to filter and display phones based on user input criteria
        function filterPhones() {
            const ram = parseInt(document.getElementById("ramInput").value);
            const rom = parseInt(document.getElementById("romInput").value);
            const graphics = document.getElementById("graphicsInput").value;
            const camera = parseInt(document.getElementById("cameraInput").value);

            const phones = [];
            const recommendations = document.getElementById("recommendations");
            recommendations.innerHTML = ""; // Clear previous results

            // Filter phones based on criteria
            phoneList.forEach(phone => {
                if (phone.ram >= ram && phone.rom >= rom && phone.graphics === graphics && phone.camera >= camera) {
                    phones.push(phone);
                }
            });

            // Display results
            if (phones.length > 0) {
                phones.forEach(phone => {
                    const div = document.createElement("div");
                    div.classList.add("recommendation-item");

                    // Properly set text content using template literals
                    div.textContent = Model: ${phone.name} - RAM: ${phone.ram}GB, ROM: ${phone.rom}GB, Camera: ${phone.camera}MP, Graphics: ${phone.graphics};
                    
                    recommendations.appendChild(div);
                });
            } else {
                recommendations.textContent = "No phones match your criteria.";
            }
        }
    </script>

</body>
</html>
