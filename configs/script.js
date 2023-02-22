// priority: 0

console.info('Hello, World! (You will see this line every time server resources reload)')

ServerEvents.recipes(event => {
	// Change recipes here
	event.remove({output: 'minecraft:fermented_spider_eye'})
	event.remove({output: 'minecraft:diamond_pickaxe'})
	event.remove({output: 'minecraft:diamond_axe'})
	event.remove({output: 'minecraft:diamond_sword'})
	event.remove({output: 'minecraft:diamond_hoe'})
	event.remove({output: 'minecraft:diamond_shovel'})
	event.remove({output: 'minecraft:diamond_chisel'})
	event.remove({output: 'minecraft:diamond_knife'})
	event.remove({output: 'minecraft:diamond_helmet'})
	event.remove({output: 'minecraft:diamond_chestplate'})
	event.remove({output: 'minecraft:diamond_leggings'})
	event.remove({output: 'minecraft:diamond_boots'})
	event.remove({output: 'minecraft:ender_eye'})
	event.remove({output: 'farmersdelight:diamond_knife'})
})

ServerEvents.tags('item', event => {
	// Get the #forge:cobblestone tag collection and add Diamond Ore to it
	// event.get('forge:cobblestone').add('minecraft:diamond_ore')

	// Get the #forge:cobblestone tag collection and remove Mossy Cobblestone from it
	// event.get('forge:cobblestone').remove('minecraft:mossy_cobblestone')
})