// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("DOMContentLoaded", () => {
    const parentCategorySelect = document.getElementById("parent_category");
    const subcategorySelect = document.getElementById("sub_category");
    const subcategoriesDiv = document.getElementById("subcategories");
  
    parentCategorySelect.addEventListener("change", function () {
      const parentId = this.value;
  
      if (parentId) {
        // Show the subcategories div
        subcategoriesDiv.style.display = "block";
  
        // Fetch the subcategories via AJAX
        fetch(`/categories/${parentId}/subcategories`)
          .then((response) => response.json())
          .then((data) => {
            // Clear existing options
            subcategorySelect.innerHTML = "";
  
            // Populate the subcategory dropdown
            data.forEach((subcategory) => {
              const option = document.createElement("option");
              option.value = subcategory.id;
              option.textContent = subcategory.name;
              subcategorySelect.appendChild(option);
            });
          })
          .catch((error) => {
            console.error("Error fetching subcategories:", error);
          });
      } else {
        // Hide the subcategories div if no parent is selected
        subcategoriesDiv.style.display = "none";
        subcategorySelect.innerHTML = ""; // Clear the subcategory select
      }
    });
  });
  