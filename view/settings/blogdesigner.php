<?php
/*********************************************************
Front End for Blog Designer UI
@author     R.Bertram
@date       08/02/2014

****************************************************************************************
    1. Colour Picker
***************************************************************************************/

function field_colourPicker($options, $group) {
    
	// Create value for name attribute
	// $group = str_replace(" ", "_", $group);
	$fieldName = str_replace(" ", "_", $options['label']);
	$fieldID = str_replace(" ", "_", $group."-".$options['label']);
    $fieldchecked = ($options['default'] === $options['current']) ? " checked" : "";
    $fielddisabled = ($options['default'] === $options['current']) ? " field_disabled" : "";
    
echo <<<EOD

	<label for="labelfield-{$fieldID}">{$options['label']}</label>
	<div class="default_check">
	   <input type="checkbox" id="defaultfield-{$fieldID}" name="defaultfield[{$group}][{$fieldName}]" class="fld_check_default"{$fieldchecked} />Default
    </div>
	<input class="color{$fielddisabled}" type="text" data-fieldtype="{$options['type']}" data-default="{$options['default']}" id="displayfield-{$fieldID}" name="displayfield[{$group}][{$fieldName}]" value="{$options['current']}">

EOD;
}

/***************************************************************************************
    2. Font Field
***************************************************************************************/

function field_fontPicker($options, $group) { 

	// Create value for name attribute
	// $group = str_replace(" ", "_", $group);
	$fieldName = str_replace(" ", "_", $options['label']);
	$fieldID = str_replace(" ", "_", $group."-".$options['label']);
    $fieldDefault = ($options['default'] == $options['current']) ? " checked" : "";
	$fieldDisabled = ($options['default'] === $options['current']) ? " class='field_disabled'" : "";
    
echo <<<EOD

	<label for="displayfield-{$fieldID}">{$options['label']}</label>
	<div class="default_check">
		<input type="checkbox" name="defaultfield[{$group}][{$fieldName}]" id="defaultfield-{$fieldID}" class="fld_check_default"{$fieldDefault} />Default
	</div>
	<select name="displayfield[{$group}][{$fieldName}]" data-fieldtype="{$options['type']}" data-default="{$options['default']}" id="displayfield-{$fieldID}"{$fieldDisabled}>
		<option value="ARIAL" style="font-family:Arial, Helvetica, sans-serif;">Arial, Helvetica, sans-serif</option>
		<option value="CALIBRI" style="font-family:Calibri, sans-serif;">Calibri, sans-serif</option>
		<option value="COMICSANS" style="font-family:'Comic Sans MS', cursive;">Comic Sans MS, cursive</option>
		<option value="COURIER" style="font-family:'Courier New', monospace;">Courier New, monospace</option>
		<option value="IMPACT" style="font-family: Impact, Charcoal, sans-serif;">Impact, Charcoal, sans-serif</option>
		<option value="LUCIDA" style="font-family:'Lucida Console', Monaco, monospace;">Lucida Console, Monaco, monospace</option>
		<option value="TAHOMA" style="font-family:Tahoma, Geneva, sans-serif;">Tahoma, Geneva, sans-serif</option>
		<option value="TREBUCHET" style="font-family:'Trebuchet MS', sans-serif;">Trebuchet MS, sans-serif</option>
	</select>
	<script type="text/javascript">
	$(function() { $("#displayfield-{$fieldID}").val('{$options['current']}'); });
	</script>

EOD;
}

/***************************************************************************************
    3. Font Size Picker
***************************************************************************************/

function field_fontSize($options, $group) {
    
	// Create value for name attribute
	// $group = str_replace(" ", "_", $group);
	$fieldName = str_replace(" ", "_", $options['label']);
	$fieldID = str_replace(" ", "_", $group."-".$options['label']);
    $fieldDefault = ($options['default'] == $options['current']) ? " checked" : "";
    $fieldDisabled = ($options['default'] === $options['current']) ? "field_disabled" : "";
    
echo <<<EOD

	<label for="labelfield-{$fieldName}">{$options['label']}</label>
	<div class="default_check">
	   <input type="checkbox" name="defaultfield[{$group}][{$fieldName}]" id="defaultfield-{$fieldID}" class="fld_check_default"{$fieldDefault} />Default
    </div>
	<select class="{$fieldDisabled}" data-fieldtype="{$options['type']}" data-default="{$options['default']}" id="displayfield-{$fieldID}" name="displayfield[{$group}][{$fieldName}]">
		<option value="10">10px</option>
		<option value="12">12px</option>
		<option value="14">14px</option>
		<option value="16">16px</option>
		<option value="20">20px</option>
        <option value="24">24px</option>
        <option value="28">28px</option>
        <option value="32">32px</option>
        <option value="36">36px</option>
        <option value="40">40px</option>
	</select>
	<script type="text/javascript">
	$(function() { $("#displayfield-{$fieldID}").val('{$options['current']}'); });
	</script>

EOD;
}
?>

<div class="crumbtrail">
	<a href="<?=CLIENT_ROOT_BLOGCMS?>">Home</a><a href="<?=CLIENT_ROOT_BLOGCMS?>/overview/<?=$blog['id'] ?>"><?=$blog['name']?></a><a href="<?=CLIENT_ROOT_BLOGCMS?>/config/<?=$blog['id'] ?>">Settings</a><a>Blog Design</a>
</div>

<img src="<?=CLIENT_ROOT?>/resources/icons/64/paintbrush.png" class="settings-icon" /><h1 class="settings-title">Customise Blog Design</h1>

<style>
.default_check { font-size:14px; }
.field_disabled { background-color:#eee !important; color:#ccc !important; }
</style>

<script type="text/javascript">
$(document).ready(function() {
	function disableField($elem) {
		var valuedefault = $elem.attr('data-default').toUpperCase();
		$elem.val(valuedefault);
		$elem.addClass('field_disabled').attr('style','');
	}
	function enableField($elem) {
		$elem.removeClass('field_disabled').css('background-color','#' + $elem.val());
			//.prop('disabled', false)
	}

	$(".fld_check_default").click(function() {
	
		var firstDash = $(this).attr("id").indexOf("-");
		var commonName = $(this).attr("id").substring(firstDash);
		var $elem = $("#displayfield" + commonName);
		
		console.log(commonName);
		
		if($(this).is(':checked')) {
			disableField($elem);
		} else {
			enableField($elem);
		}
	});
});
</script>

<form action="<?=CLIENT_ROOT_BLOGCMS?>/config/<?=$blog['id']?>/blogdesigner/submit" method="post">

<?php
// Open JSON file here
(array) $design_settings = jsonToArray(SERVER_PATH_BLOGCMS.'/data/blogs/'.$blog['id'].'/template_config.json');

// loop through sections (head,posts,footer...)
foreach($design_settings as $key => $section):

	// Special Case
	if(strtolower($key) == 'layout') continue;

	echo "<h3>".$key."</h3>";
	
	echo "<input type='hidden' value='$section[0]' name='classname-$key'>";
	
	// loop through each rule in this section
	foreach($section as $rulekey => $rule):
	
		// Ignore if not array
		if(gettype($rule) !== "array") continue;
			
		switch($rule['type']):
			case "color":
			case "bgcolor":
				field_colourPicker($rule, $key);
				break;
				
			case "font":
				field_fontPicker($rule, $key);
				break;
			
			case "textsize":
				field_fontSize($rule, $key);
				break;
				
			default:
				// do nothing!
				break;
		endswitch;
	endforeach;
endforeach;
?>

	<div class="push-right">
        <input type="button" value="Cancel" name="goback" onclick="window.history.back()" />
		<input type="submit" value="Save Changes" />
	</div>
</form>