<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Phone    Recommendations</title>
  <style>
    /* Your styling remains here */
  </style>
</head>
<body>

  <div class="container">
    <h1>Phone Recommendations</h1>
    <div class="disclaimer">
      <strong>Get your vibe on with the best smartphone!</strong>
    </div>
    <form id="phoneForm" onsubmit="event.preventDefault(); getRecommendations();">
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

      <button type="submit">Get Recommendations</button>
    </form>

    <div id="recommendations" class="recommendations"></div>
  </div>

  <script>
    function getRecommendations() {
      // Show loading indicator
      document.getElementById("recommendations").innerHTML = "<p>Loading recommendations...</p>";

      // Get the form values with descriptive names
      const selectedRam = parseInt(document.getElementById("ram").value, 10);
      const selectedRom = parseInt(document.getElementById("rom").value, 10);
      const graphics = document.getElementById("graphics").value;
      const minCameraMP = parseInt(document.getElementById("camera").value, 10);

      const recommendations = document.getElementById("recommendations");
      recommendations.innerHTML = ""; // Clear previous recommendations

      // Validate RAM and ROM (optional)
      if (isNaN(selectedRam) || selectedRam <= 0 || isNaN(selectedRom) || selectedRom <= 0) {
        recommendations.innerHTML = "<p>Please enter valid RAM and ROM capacities.</p>";
        return;
      }

      // Ensure that the camera input is a valid positive number
      if (isNaN(minCameraMP) || minCameraMP <= 0) {
        recommendations.innerHTML = "<p>Please enter a valid camera megapixel value.</p>";
        return;
      }

      // Phone list with details
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

      // Filter phones based on the criteria
      const filteredPhones = phoneList.filter(phone =>
        phone.ram >= selectedRam &&
        phone.rom >= selectedRom &&
        phone.graphics === graphics &&
        phone.camera >= minCameraMP
      );

      // Check if any phones match and display them
      if (filteredPhones.length > 0) {
        filteredPhones.forEach(phone => {
          const div = document.createElement("div");
          div.classList.add("recommendation-item");
          div.innerHTML = `
            <strong>Mobile:</strong> ${phone.name} <br>
            <strong>RAM:</strong> ${phone.ram}GB <br>
            <strong>ROM:</strong> ${phone.rom}GB <br>
            <strong>Graphics:</strong> ${phone.graphics} <br>
            <strong>Camera:</strong> ${phone.camera}MP <br>
          `;
          recommendations.appendChild(div);
        });
      } else {
        recommendations.innerHTML = "<p>No phones match your criteria.</p>";
      }
    }
  </script>

</body>
</html>
