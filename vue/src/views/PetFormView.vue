<template>
    <div class="container">
        <form class="form-rounded">
            <div class="form-group">
                <label for="species">Species:</label>
                <select class="form-select" id="species">
                    <option selected>Species</option>
                    <option>Cat</option>
                    <option >Dog</option>
                </select>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-select" id="gender">
                    <option selected>Gender</option>
                    <option>Male</option>
                    <option >Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" min="1" max="20" id="age">
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name">
            </div>
            <div class="form-group">
                <label for="breed">Breed:</label>
                <input type="text" id="breed">
            </div>
            <div class="form-group">
                <label for="size">Size:</label>
                <select class="form-select" id="size">
                    <option selected>Size</option>
                    <option>Small</option>
                    <option >Medium</option>
                    <option>Large</option>
                    <option>X-Large</option>
                </select>
            </div>
            <div class="form-group">
                <label for="color">Color:</label>
                <input type="text" id="color">
            </div>
            <div class="form-group">
    <label for="description">Description:</label>
    <textarea class="form-control" id="description" rows="3"></textarea>
  </div>
        </form>
    </div>
</template>

<script>
    export default {
        
    }
</script>

<style scoped>

</style>