/*
 * Copyright (C) 2021-2026, 5DPLAY Game Studio
 * All rights reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import flash.display.MovieClip;

/**
 * 角色主时间轴第 1 帧的共用表面。
 *
 * <p>由 <code>include</code> 贴进 <code>main_mc</code>。没有包和类，变量与函数直接挂在时间轴实例上。本文件必须是该帧的第一条语句。版本号写在 include 之后，缺省时引擎按 1 处理。</p>
 *
 * <p>引擎调用 <code>initFighter</code> 注入四个门面。第 2 帧用这里的数值属性和 <code>defineAction</code> 等登记数据，再调用 <code>initMc</code>。</p>
 *
 * @example
 * <listing version="3.0">
 * include '../Include.as';
 * </listing>
 * @see net.play5d.game.bvn.fighter.api.v1.FighterApi
 * @see net.play5d.game.bvn.fighter.api.v1.FighterMcApi
 * @see net.play5d.game.bvn.fighter.api.v1.FighterEffectApi
 * @see net.play5d.game.bvn.fighter.api.v1.FighterCameraApi
 */
{
    //--------------------------------------------------------------------------
    //
    //  属性
    //
    //--------------------------------------------------------------------------

    /**
     * 角色门面。
     *
     * <p><code>initFighter</code> 写入。子元件通过这个名字调用。</p>
     *
     * @see net.play5d.game.bvn.fighter.api.v1.FighterApi
     */
    var $fighter_ctrler:*;

    /**
     * 动作门面。
     *
     * <p><code>initFighter</code> 写入。子元件通过这个名字调用。</p>
     *
     * @see net.play5d.game.bvn.fighter.api.v1.FighterMcApi
     */
    var $mc_ctrler:*;

    /**
     * 特效门面。
     *
     * <p><code>initFighter</code> 写入。子元件通过这个名字调用。</p>
     *
     * @see net.play5d.game.bvn.fighter.api.v1.FighterEffectApi
     */
    var $effect_ctrler:*;

    /**
     * 镜头门面。
     *
     * <p><code>initFighter</code> 写入。子元件通过这个名字调用。</p>
     *
     * @see net.play5d.game.bvn.fighter.api.v1.FighterCameraApi
     */
    var $camera_ctrler:*;

    /**
     * 登记一条攻击。
     *
     * <p><code>initFighter</code> 之后指向角色门面的同名方法。</p>
     *
     * @example
     * <listing version="3.0">
     * defineAction('k1', {power: 30});
     * </listing>
     */
    var defineAction:Function;

    /**
     * 登记必杀立绘。
     *
     * <p><code>initFighter</code> 之后指向角色门面的同名方法。</p>
     *
     * @example
     * <listing version="3.0">
     * defineBishaFace('face1', faceClass);
     * </listing>
     */
    var defineBishaFace:Function;

    /**
     * 登记受击音。
     *
     * <p><code>initFighter</code> 之后指向角色门面的同名方法。</p>
     *
     * @example
     * <listing version="3.0">
     * defineHurtSound(hurtSnd);
     * </listing>
     */
    var defineHurtSound:Function;

    /**
     * 登记击飞音。
     *
     * <p><code>initFighter</code> 之后指向角色门面的同名方法。</p>
     *
     * @example
     * <listing version="3.0">
     * defineHurtFlySound(flySnd);
     * </listing>
     */
    var defineHurtFlySound:Function;

    /**
     * 登记死亡音。
     *
     * <p><code>initFighter</code> 之后指向角色门面的同名方法。</p>
     *
     * @example
     * <listing version="3.0">
     * defineDieSound(dieSnd);
     * </listing>
     */
    var defineDieSound:Function;

    //--------------------------------------------------------------------------
    //
    //  构造
    //
    //--------------------------------------------------------------------------

    // 停在第 1 帧，等引擎调用 initFighter。
	{
        stop();
	}


    //--------------------------------------------------------------------------
    //
    //  方法
    //
    //--------------------------------------------------------------------------

    /**
     * 写入四个门面，并接上登记方法。
     *
     * @param param 引擎传入的门面。字段为 <code>fighter_ctrler</code>、<code>mc_ctrler</code>、<code>effect_ctrler</code>、<code>camera_ctrler</code>。
     * @example
     * <listing version="3.0">
     * initFighter({
     *     fighter_ctrler: fighter,
     *     mc_ctrler     : mcCtrl,
     *     effect_ctrler : effect,
     *     camera_ctrler : camera
     * });
     * </listing>
     */
    function initFighter(param:Object):void {
        $fighter_ctrler = param.fighter_ctrler;
        $mc_ctrler      = param.mc_ctrler;
        $effect_ctrler  = param.effect_ctrler;
        $camera_ctrler  = param.camera_ctrler;

        defineAction       = $fighter_ctrler.defineAction;
        defineBishaFace    = $fighter_ctrler.defineBishaFace;
        defineHurtSound    = $fighter_ctrler.defineHurtSound;
        defineHurtFlySound = $fighter_ctrler.defineHurtFlySound;
        defineDieSound     = $fighter_ctrler.defineDieSound;
    }

    /**
     * 把动作元件交给角色门面。
     *
     * <p>未摆放实例时直接返回。</p>
     *
     * @param mc 第 2 帧上的动作元件实例。
     * @example
     * <listing version="3.0">
     * initMc(mc);
     * </listing>
     */
    function initMc(mc:MovieClip):void {
        if (!mc) {
            return;
        }

        $fighter_ctrler.initMc(mc);
    }

    /**
     * 当前血量。写入时同时写入上限。
     *
     * @return 当前血量。
     * @example
     * <listing version="3.0">
     * hp = 300;
     * </listing>
     */
    function get hp():Number {
        return $fighter_ctrler.hp;
    }

    /** @private */
    function set hp(value:Number):void {
        $fighter_ctrler.hp = value;
    }

    /**
     * 灵压上限。读取的是上限，写入时同时写入当前灵压。
     *
     * @return 灵压上限。
     * @example
     * <listing version="3.0">
     * energy = 100;
     * </listing>
     */
    function get energy():Number {
        return $fighter_ctrler.energy;
    }

    /** @private */
    function set energy(value:Number):void {
        $fighter_ctrler.energy = value;
    }

    /**
     * 移动速度。
     *
     * @return 移动速度。
     * @example
     * <listing version="3.0">
     * speed = 7;
     * </listing>
     */
    function get speed():Number {
        return $fighter_ctrler.speed;
    }

    /** @private */
    function set speed(value:Number):void {
        $fighter_ctrler.speed = value;
    }

    /**
     * 跳跃力。
     *
     * @return 跳跃力。
     * @example
     * <listing version="3.0">
     * jumpPower = 15;
     * </listing>
     */
    function get jumpPower():Number {
        return $fighter_ctrler.jumpPower;
    }

    /** @private */
    function set jumpPower(value:Number):void {
        $fighter_ctrler.jumpPower = value;
    }

    /**
     * 体格。
     *
     * @return 体格。
     * @example
     * <listing version="3.0">
     * heavy = 1;
     * </listing>
     */
    function get heavy():Number {
        return $fighter_ctrler.heavy;
    }

    /** @private */
    function set heavy(value:Number):void {
        $fighter_ctrler.heavy = value;
    }

    /**
     * 防御类型。
     *
     * @return 防御类型。
     * @example
     * <listing version="3.0">
     * defenseType = 1;
     * </listing>
     */
    function get defenseType():int {
        return $fighter_ctrler.defenseType;
    }

    /** @private */
    function set defenseType(value:int):void {
        $fighter_ctrler.defenseType = value;
    }
}