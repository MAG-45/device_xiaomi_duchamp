# 1. Apply Git Changes (Source Modification)
echo "Applying source modifications..."

# UDFPS Patch for frameworks/base
#echo "Patch FP"
#cd frameworks/base
#wget https://raw.githubusercontent.com/MAG-45/duchamp_patch/refs/heads/vic_evo/fp_evo_qpr2.patch
#git am < fp_evo_qpr2.patch
#cd ../../

# Hardware Compatibility Fixes
echo "Fetching and applying hardware compatibility fixes for hardware/lineage/compat..."
cd hardware/lineage/compat
git fetch https://github.com/xiaomi-mt6897-duchamp/android_hardware_lineage_compat
git cherry-pick 9a046ea7e5899adc38ab04fe24eb34859fe4d779
cd ../../../


# OLD WAY
# Add WPA3 fix patch
#echo "Patching WPA3 to work on duchamp device..."
#cd external/wpa_supplicant_8
#git fetch https://github.com/xiaomi-mt6897-duchamp/android_external_wpa_supplicant_8
#git cherry-pick cc88629c6c5c2c2353bf87efef9b5c9c5bf32bee
#cd ../../

# NEW WAY
# Add WPA2/WPA3 fix
echo "Patching WPA2/3 to work on duchamp device"
cd external
rm -rf wpa_supplicant_8
git clone https://github.com/snapboss/test_external_wpa_supplicant_8.git wpa_supplicant_8 --depth=1
cd ../

echo "All operations completed successfully!"
