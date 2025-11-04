import InviteTreeNode from "../components/invite-tree-node";
import { i18n } from "discourse-i18n";

<template>
  <div class="invite-tree-container">
    <div class="invite-tree-header">
      <h1>{{i18n "invite_tree.title"}}</h1>
      <p class="invite-tree-description">{{i18n "invite_tree.description"}}</p>
    </div>

    {{#if @model.summary}}
      <div class="invite-tree-summary">
        <h2>{{i18n "invite_tree.summary.title"}}</h2>
        <div class="summary-stats">
          <div class="stat">
            <span class="stat-label">{{i18n "invite_tree.summary.total_users"}}</span>
            <span class="stat-value">{{@model.total_users}}</span>
          </div>
          <div class="stat">
            <span class="stat-label">{{i18n "invite_tree.summary.total_inviters"}}</span>
            <span class="stat-value">{{@model.summary.total_inviters}}</span>
          </div>
          <div class="stat">
            <span class="stat-label">{{i18n "invite_tree.summary.total_invites"}}</span>
            <span class="stat-value">{{@model.summary.total_invites}}</span>
          </div>
          <div class="stat">
            <span class="stat-label">{{i18n "invite_tree.summary.total_problematic"}}</span>
            <span class="stat-value">{{@model.summary.total_problematic}}</span>
          </div>
          <div class="stat">
            <span class="stat-label">{{i18n "invite_tree.summary.overall_success_rate"}}</span>
            <span class="stat-value">{{@model.summary.overall_success_rate}}%</span>
          </div>
        </div>
      </div>
    {{/if}}

    {{#if @model.problematic_inviters}}
      <div class="invite-tree-problematic">
        <h2>{{i18n "invite_tree.problematic_inviters.title"}}</h2>
        <p class="problematic-description">{{i18n "invite_tree.problematic_inviters.description"}}</p>
        {{#if @model.problematic_inviters.length}}
          <table class="problematic-inviters-table">
            <thead>
              <tr>
                <th>{{i18n "invite_tree.problematic_inviters.username"}}</th>
                <th>{{i18n "invite_tree.problematic_inviters.total_invites"}}</th>
                <th>{{i18n "invite_tree.problematic_inviters.problematic_invites"}}</th>
                <th>{{i18n "invite_tree.problematic_inviters.quality_score"}}</th>
              </tr>
            </thead>
            <tbody>
              {{#each @model.problematic_inviters as |inviter|}}
                <tr>
                  <td><a href="/u/{{inviter.username}}">{{inviter.username}}</a></td>
                  <td>{{inviter.total_invites}}</td>
                  <td>{{inviter.problematic_invites}}</td>
                  <td>{{inviter.quality_score}}%</td>
                </tr>
              {{/each}}
            </tbody>
          </table>
        {{else}}
          <p class="no-problematic">{{i18n "invite_tree.problematic_inviters.none"}}</p>
        {{/if}}
      </div>
    {{/if}}

    <div class="invite-tree-content">
      {{#if @model.roots}}
        <div class="invite-tree-roots">
          {{#each @model.roots as |user|}}
            <InviteTreeNode @user={{user}} @depth={{0}} />
          {{/each}}
        </div>
      {{else}}
        <div class="invite-tree-empty">
          {{i18n "invite_tree.no_invites"}}
        </div>
      {{/if}}
    </div>
  </div>
</template>
