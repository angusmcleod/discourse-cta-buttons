import Component from "@glimmer/component";
import DButton from "discourse/components/d-button";
import themeSetting from "discourse/helpers/theme-setting";
import { iconNode } from "discourse-common/lib/icon-library";
import { htmlSafe } from "@ember/template";
import DiscourseURL from "discourse/lib/url";
import { on } from "@ember/modifier";
import { service } from "@ember/service";
import { action } from "@ember/object";
import { dasherize } from "@ember/string";

export default class CtaButton extends Component {
  @service site;

  get target() {
    if (settings[`${this.type}_new_tab`]) {
      return '_blank';
    }
    return '';
  }

  get icon() {
    if (settings[`${this.type}_custom_icon`]) {
      return htmlSafe(`<img src=${settings[`${this.type}_custom_icon`]} class="d-icon" />`);
    } else if (settings[`${this.type}_icon`]) {
      return iconNode(settings[`${this.type}_icon`]);
    }
  }

  get showLabel() {
    return !this.site.mobileView || settings[`${this.type}_mobile_label`];
  }

  get label() {
    if (this.showLabel && settings[`${this.type}_label`]) {
      return htmlSafe(`<span class="d-button-label">${settings[`${this.type}_label`]}</span>`)
    }
  }

  @action
  click() {
    if (settings[`${this.type}_url`]) {
      DiscourseURL.routeTo(settings[`${this.type}_url`]);
    }
  }

  get href() {
    return settings[`${this.type}_url`];
  }

  get title() {
    return settings[`${this.type}_title`];
  }

  get id() {
    return `${dasherize(this.type)}-cta-button`;
  }

  <template>
    {{#if this.label}}
      <a
        id={{this.id}}
        href={{this.href}}
        target={{this.target}}
        class="btn cta-button"
        role="button"
        title={{this.title}}>
        {{this.icon}}
        {{this.label}}
      </a>
    {{/if}}
  </template>
}