<template>
    <div class="home">
       <top-menu></top-menu>
       <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
        <div class="container pc-container">
        <div class="video-bg">
            <video loop="loop" muted="muted" autoplay="autoplay" src="https://dc.xhscdn.com/9379abe0-7ad8-11e9-8794-9320f6c9d557/%E8%83%8C%E6%99%AF%E8%A7%86%E9%A2%91.mp4" preload="auto" class="my-video"></video>
        </div>
        <div class="content">
            <div class="middle">
                <div class="middle-wrapper">
                    <div class="iphone-wrapper">
                        <div class="iphone">
                            <div class="iphone-mp4">
                                <video loop="loop" muted="muted" autoplay="autoplay" src="http://dc.xhscdn.com/a10d0710-80f1-11e9-9036-5948d2131083/new5.27.mp4" preload="auto" class="my-video"></video>
                            </div>
                            <div class="iphone-case"></div>
                        </div>
                    </div>
                    <div class="description">
                        <div class="logo-big"></div>
                        <h2 class="lifestyle">标记我的生活</h2>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
       <bottom-menu></bottom-menu>
    </div>
</template>

<script>

export default {
    
}
</script>

<style scoped>
.bottom-nav{
    position: absolute;
}
.zind{
    z-index: -1;
}
.container{
    z-index: -1;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    position: fixed;
}

.video-bg{
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    top: 0;
}

.video-bg .my-video{
    min-width: 100%;
    min-height: 100%;
}

.content{
    position: relative;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
}



.content .middle{
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    position: absolute;
    width: 100%;
    height: 100%;
}

.content .middle .middle-wrapper{
    top: 50%;
    left: 50%;
    transform: translate(-60%,-60%);
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    position: absolute;
}

@media screen and (max-height: 540px){
    .middle-wrapper{
        zoom: .6;
    }
}

@media screen and (max-height: 720px){
    .middle-wrapper{
        zoom: .7;
    }
}

@media screen and (max-height: 820px){
    .middle-wrapper{
        zoom: .8;
    }
}

.content .middle .middle-wrapper .iphone-wrapper{
    margin-right: 60px;
}

@media screen and (max-height: 540px){
    .iphone{
        zoom: .6;
    }
}

@media screen and (max-height: 720px){
    .iphone{
        zoom: .7;
    }
}

@media screen and (max-height: 820px){
    .iphone{
        zoom: .8;
    }
}

.iphone{
    width: 300px;
    height: 600px;
    position: relative;
}

.iphone .iphone-mp4{
    position: absolute;
    width: 260px;
    height: 564px;
    margin: 18px 20px;
}

.iphone .iphone-mp4 .my-video{
    width: 260px;
    height: 564px;
}

.iphone .iphone-case{
    position: absolute;
    width: 300px;
    height: 600px;
    background-image: url(http://ci.xiaohongshu.com/3ca6607e-d4a5-4cb9-b455-a746713d8283);
    background-repeat: no-repeat;
    background-size: contain;
}

.content .middle .middle-wrapper .description{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
}

.content .middle .middle-wrapper .description .logo-big{
    width: 143px;
    height: 60px;
    background-image: url('../../assets/项目logo.png');
    background-size: contain;
    background-repeat: no-repeat;
    background-position: 50%;
}

.content .middle .middle-wrapper .description .lifestyle{
    white-space: nowrap;
    color: #fff;
    font-size: 48px;
    font-weight: 500;
    margin: 13px 0 0;
}

.video-bg:before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background: transparent;
}

</style>

