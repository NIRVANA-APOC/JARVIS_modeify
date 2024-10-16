$models = @(
    "nlpconnect/vit-gpt2-image-captioning",
    "lllyasviel/ControlNet",
    "lllyasviel/sd-controlnet-canny",
    "lllyasviel/sd-controlnet-depth",
    "lllyasviel/sd-controlnet-hed",
    "lllyasviel/sd-controlnet-mlsd",
    "lllyasviel/sd-controlnet-openpose",
    "lllyasviel/sd-controlnet-scribble",
    "lllyasviel/sd-controlnet-seg",
    "runwayml/stable-diffusion-v1-5",
    "damo-vilab/text-to-video-ms-1.7b",
    "microsoft/speecht5_asr",
    "JorisCos/DCCRNet_Libri1Mix_enhsingle_16k",
    "espnet/kan-bayashi_ljspeech_vits",
    "facebook/detr-resnet-101",
    "microsoft/speecht5_hifigan",
    "microsoft/speecht5_vc",
    "openai/whisper-base",
    "Intel/dpt-large",
    "facebook/detr-resnet-50-panoptic",
    "facebook/detr-resnet-50",
    "google/owlvit-base-patch32",
    "impira/layoutlm-document-qa",
    "ydshieh/vit-gpt2-coco-en",
    "dandelin/vilt-b32-finetuned-vqa",
    "lambdalabs/sd-image-variations-diffusers",
    "facebook/maskformer-swin-base-coco",
    "Intel/dpt-hybrid-midas"
)

$CURRENT_DIR = Get-Location

foreach ($model in $models) {
    # Write-Host "----- Downloading from https://huggingface.co/$model -----"
    Write-Host "----- Downloading from https://hf-mirror.com/$model -----"
    if (Test-Path $model) {
        Set-Location $model
        git pull
        git lfs pull
        Set-Location $CURRENT_DIR
    } else {
        # git clone "https://huggingface.co/$model" $model
        git clone "https://hf-mirror.com/$model" $model
    }
}

$datasets = @(
    "Matthijs/cmu-arctic-xvectors"
)

foreach ($dataset in $datasets) {
    # Write-Host "----- Downloading from https://huggingface.co/datasets/$dataset -----"
    Write-Host "----- Downloading from https://hf-mirror.com/datasets/$dataset -----"
    if (Test-Path $dataset) {
        Set-Location $dataset
        git pull
        git lfs pull
        Set-Location $CURRENT_DIR
    } else {
        # git clone "https://huggingface.co/datasets/$dataset" $dataset
        git clone "https://hf-mirror.com/datasets/$dataset" $dataset
    }
}