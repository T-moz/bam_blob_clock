import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';


const ZERO_PATH = 'M55.4858 179C38.1578 179 24.7058 171.172 15.1298 155.516C5.70575 139.708 0.99375 117.82 0.99375 89.852C0.99375 61.732 5.70575 39.844 15.1298 24.188C24.7058 8.53199 38.1578 0.703985 55.4858 0.703985C67.0378 0.703985 76.8418 4.35199 84.8978 11.648C93.1058 18.792 99.3378 29.052 103.594 42.428C107.85 55.652 109.978 71.46 109.978 89.852C109.978 108.244 107.85 124.128 103.594 137.504C99.3378 150.728 93.1058 160.988 84.8978 168.284C76.8418 175.428 67.0378 179 55.4858 179ZM55.4858 155.288C62.4778 155.288 68.2538 152.476 72.8138 146.852C77.3738 141.076 80.7938 133.248 83.0738 123.368C85.3538 113.488 86.4938 102.316 86.4938 89.852C86.4938 77.388 85.3538 66.216 83.0738 56.336C80.7938 46.456 77.3738 38.628 72.8138 32.852C68.2538 27.076 62.4778 24.188 55.4858 24.188C48.4938 24.188 42.7178 27.076 38.1578 32.852C33.5978 38.476 30.1778 46.228 27.8978 56.108C25.6178 65.988 24.4778 77.236 24.4778 89.852C24.4778 102.468 25.6178 113.716 27.8978 123.596C30.1778 133.476 33.5978 141.228 38.1578 146.852C42.8698 152.476 48.6458 155.288 55.4858 155.288Z';
const ZERO_EXTRA_PATH = 'M55.4858 179C38.1578 179 24.7058 171.172 15.1298 155.516';
const ONE_PATH = 'M47.6941 179C44.6541 179 41.9941 177.86 39.7141 175.58C37.4341 173.3 36.2941 170.564 36.2941 167.372V28.292L19.6501 35.36C17.0661 36.424 14.6341 36.956 12.3541 36.956C9.01009 36.956 6.19809 35.892 3.91809 33.764C1.79009 31.636 0.726094 28.9 0.726094 25.556C0.726094 23.124 1.33409 20.92 2.55009 18.944C3.76609 16.968 5.66609 15.524 8.25009 14.612L43.8181 1.844C44.5781 1.53999 45.3381 1.31199 46.0981 1.15999C46.8581 1.00799 47.5421 0.931996 48.1501 0.931996C51.6461 0.931996 54.3821 2.07199 56.3581 4.35199C58.4861 6.47999 59.5501 9.29199 59.5501 12.788V167.372C59.5501 170.564 58.4101 173.3 56.1301 175.58C53.8501 177.86 51.0381 179 47.6941 179Z';
const ONE_EXTRA_PATH = 'M47.6941 179C44.6541 179 41.9941 177.86 39.7141 175.58';
const TWO_PATH = 'M11.9285 179C8.58447 179 5.77247 177.86 3.49247 175.58C1.36447 173.3 0.30047 170.564 0.30047 167.372C0.30047 164.028 1.36447 161.292 3.49247 159.164L68.2445 83.468C72.8045 78.148 76.3005 73.132 78.7325 68.42C81.3165 63.708 82.6085 59.224 82.6085 54.968C82.6085 45.088 80.0245 37.184 74.8565 31.256C69.8405 25.328 62.9245 22.364 54.1085 22.364C48.3325 22.364 43.0885 23.884 38.3765 26.924C33.8165 29.812 30.1685 33.764 27.4325 38.78C24.8485 43.644 23.5565 49.04 23.5565 54.968C23.5565 58.008 22.4165 60.668 20.1365 62.948C18.0085 65.228 15.2725 66.368 11.9285 66.368C8.73647 66.368 6.00047 65.228 3.72047 62.948C1.44047 60.668 0.30047 58.008 0.30047 54.968C0.30047 44.632 2.65647 35.436 7.36847 27.38C12.0805 19.172 18.4645 12.712 26.5205 7.99999C34.7285 3.28799 43.9245 0.931996 54.1085 0.931996C64.4445 0.931996 73.4125 3.13599 81.0125 7.54399C88.6125 11.952 94.4645 18.184 98.5685 26.24C102.824 34.296 104.952 43.872 104.952 54.968C104.952 59.832 103.888 64.772 101.76 69.788C99.7845 74.804 97.2005 79.592 94.0085 84.152C90.9685 88.712 87.8525 92.816 84.6605 96.464L32.4485 155.744H96.2885C99.6325 155.744 102.444 156.96 104.724 159.392C107.004 161.672 108.144 164.332 108.144 167.372C108.144 170.564 107.004 173.3 104.724 175.58C102.444 177.86 99.6325 179 96.2885 179H11.9285Z';
const TWO_EXTRA_PATH = 'M11.9285 179C8.58447 179 5.77247 177.86 3.49247 175.58';
const THREE_PATH = 'M59.3919 179C47.9919 179 37.8839 176.644 29.0679 171.932C20.2519 167.068 13.3359 160.532 8.31986 152.324C3.30386 143.964 0.79586 134.616 0.79586 124.28C0.79586 120.784 1.78386 117.972 3.75986 115.844C5.88786 113.564 8.39586 112.424 11.2839 112.424C14.3239 112.424 16.8319 113.564 18.8079 115.844C20.7839 117.972 21.7719 120.784 21.7719 124.28C21.7719 130.512 23.3679 136.288 26.5599 141.608C29.7519 146.776 34.0839 150.956 39.5559 154.148C45.0279 157.188 51.1839 158.708 58.0239 158.708C68.0559 158.708 76.1119 155.972 82.1919 150.5C88.4239 144.876 91.5399 137.048 91.5399 127.016C91.5399 120.632 90.1719 114.932 87.4359 109.916C84.6999 104.748 80.9759 100.644 76.2639 97.604C71.5519 94.564 66.2319 93.044 60.3039 93.044C56.9599 93.044 54.1479 91.904 51.8679 89.624C49.7399 87.344 48.6759 84.532 48.6759 81.188C48.6759 77.844 49.7399 75.108 51.8679 72.98C54.1479 70.7 56.9599 69.56 60.3039 69.56C64.5599 69.56 68.6639 68.496 72.6159 66.368C76.5679 64.088 79.8359 61.124 82.4199 57.476C85.0039 53.676 86.2959 49.42 86.2959 44.708C86.2959 38.02 83.8639 32.396 78.9999 27.836C74.1359 23.276 67.9039 20.996 60.3039 20.996C54.5279 20.996 49.2079 22.136 44.3439 24.416C39.6319 26.696 35.8319 29.736 32.9439 33.536C30.2079 37.336 28.8399 41.592 28.8399 46.304C28.8399 49.8 27.8519 52.764 25.8759 55.196C23.8999 57.476 21.3919 58.616 18.3519 58.616C15.4639 58.616 12.9559 57.552 10.8279 55.424C8.85186 53.144 7.86386 50.332 7.86386 46.988C7.86386 38.172 10.1439 30.268 14.7039 23.276C19.2639 16.284 25.4959 10.812 33.3999 6.85999C41.3039 2.75599 50.1199 0.703985 59.8479 0.703985C68.8159 0.703985 76.8719 2.67999 84.0159 6.63199C91.3119 10.432 97.0119 15.676 101.116 22.364C105.372 28.9 107.5 36.348 107.5 44.708C107.5 50.636 106.132 55.88 103.396 60.44C100.812 65 97.4679 68.952 93.3639 72.296C89.2599 75.488 84.9279 78.148 80.3679 80.276C92.3759 84.38 101.04 90.612 106.36 98.972C111.832 107.18 114.568 116.604 114.568 127.244C114.568 137.124 112.06 146.016 107.044 153.92C102.028 161.672 95.3399 167.828 86.9799 172.388C78.6199 176.796 69.4239 179 59.3919 179Z';
const THREE_EXTRA_PATH = 'M59.3919 179C47.9919 179 37.8839 176.644 29.0679 171.932';
const FOUR_PATH = 'M99.0775 179C96.0375 179 93.4535 177.86 91.3255 175.58C89.1975 173.3 88.1335 170.564 88.1335 167.372V138.644H12.2095C8.71348 138.644 5.97748 137.58 4.00148 135.452C2.02548 133.324 0.885485 130.892 0.581485 128.156C0.429485 125.268 1.18948 122.684 2.86148 120.404L90.1855 5.94799C91.4015 4.42799 92.7695 3.21199 94.2895 2.29999C95.9615 1.38799 97.7855 0.931996 99.7615 0.931996C102.953 0.931996 105.537 2.07199 107.513 4.35199C109.489 6.63199 110.477 9.44399 110.477 12.788V117.668H124.157C127.349 117.668 130.085 118.428 132.365 119.948C134.645 121.468 135.785 124.204 135.785 128.156C135.785 131.044 134.645 133.552 132.365 135.68C130.085 137.656 127.349 138.644 124.157 138.644H110.477V167.372C110.477 170.564 109.413 173.3 107.285 175.58C105.157 177.86 102.421 179 99.0775 179ZM88.1335 117.668V42.2L30.6775 117.668H88.1335Z';
const FOUR_EXTRA_PATH = 'M99.0775 179C96.0375 179 93.4535 177.86 91.3255 175.58';
const FIVE_PATH = 'M58.5367 179C47.5927 179 37.7127 176.492 28.8967 171.476C20.2327 166.308 13.3167 159.316 8.14869 150.5C3.13269 141.684 0.624689 131.804 0.624689 120.86C0.624689 117.516 1.68869 114.78 3.81669 112.652C5.94469 110.372 8.68069 109.232 12.0247 109.232C15.3687 109.232 18.1807 110.372 20.4607 112.652C22.7407 114.78 23.8807 117.516 23.8807 120.86C23.8807 127.396 25.4007 133.324 28.4407 138.644C31.4807 143.964 35.5847 148.144 40.7527 151.184C46.0727 154.224 52.0007 155.744 58.5367 155.744C65.2247 155.744 71.1527 154.224 76.3207 151.184C81.6407 148.144 85.8207 143.964 88.8607 138.644C91.9007 133.324 93.4207 127.396 93.4207 120.86C93.4207 114.172 91.9007 108.244 88.8607 103.076C85.8207 97.756 81.6407 93.576 76.3207 90.536C71.1527 87.496 65.2247 85.976 58.5367 85.976H20.4607C17.1167 85.976 14.3807 84.912 12.2527 82.784C10.1247 80.504 9.06069 77.692 9.06069 74.348V12.788C9.06069 9.44399 10.1247 6.63199 12.2527 4.35199C14.3807 2.07199 17.1167 0.931996 20.4607 0.931996H96.6127C99.8047 0.931996 102.541 2.14799 104.821 4.57999C107.101 6.85999 108.241 9.59599 108.241 12.788C108.241 15.828 107.101 18.488 104.821 20.768C102.693 23.048 99.9567 24.188 96.6127 24.188H32.0887V62.72H58.5367C69.6327 62.72 79.5127 65.304 88.1767 70.472C96.9927 75.488 103.909 82.404 108.925 91.22C114.093 99.884 116.677 109.764 116.677 120.86C116.677 131.804 114.093 141.684 108.925 150.5C103.909 159.316 96.9927 166.308 88.1767 171.476C79.5127 176.492 69.6327 179 58.5367 179Z';
const FIVE_EXTRA_PATH = 'M58.5367 179C47.5927 179 37.7127 176.492 28.8967 171.476';
const SIX_PATH = 'M53.8878 178C43.3998 178 34.0518 175.72 25.8438 171.16C17.7878 166.448 11.4798 160.064 6.91977 152.008C2.35977 143.8 0.0797668 134.452 0.0797668 123.964C0.0797668 112.26 2.96777 101.924 8.74377 92.956L60.4998 6.54399C63.2358 2.28799 66.7318 0.159993 70.9878 0.159993C74.1798 0.159993 76.8398 1.07199 78.9678 2.896C81.0958 4.71999 82.3878 6.99999 82.8438 9.73599C83.4518 12.472 82.9198 15.208 81.2478 17.944L50.0118 69.928C51.2278 69.776 52.5198 69.7 53.8878 69.7C64.3758 69.7 73.6478 72.056 81.7038 76.768C89.7598 81.328 96.0678 87.712 100.628 95.92C105.188 103.976 107.468 113.324 107.468 123.964C107.468 134.452 105.188 143.8 100.628 152.008C96.0678 160.064 89.7598 166.448 81.7038 171.16C73.6478 175.72 64.3758 178 53.8878 178ZM53.6598 157.48C63.0838 157.48 70.7598 154.364 76.6878 148.132C82.6158 141.9 85.5798 133.844 85.5798 123.964C85.5798 114.084 82.6158 106.028 76.6878 99.796C70.7598 93.412 63.0838 90.22 53.6598 90.22C44.3878 90.22 36.7878 93.412 30.8598 99.796C24.9318 106.028 21.9678 114.084 21.9678 123.964C21.9678 133.844 24.9318 141.9 30.8598 148.132C36.7878 154.364 44.3878 157.48 53.6598 157.48Z';
const SIX_EXTRA_PATH = 'M53.8878 178C43.3998 178 34.0518 175.72 25.8438 171.1';
const SEVEN_PATH = 'M25.7603 179C22.7203 179 20.0603 177.86 17.7803 175.58C15.5003 173.3 14.3603 170.564 14.3603 167.372C14.3603 165.244 15.0443 162.812 16.4123 160.076L81.8483 24.188H12.5363C9.19225 24.188 6.38025 23.124 4.10025 20.996C1.97225 18.716 0.90825 15.904 0.90825 12.56C0.90825 9.21599 1.97225 6.47999 4.10025 4.35199C6.38025 2.07199 9.19225 0.931996 12.5363 0.931996H99.4043C102.596 0.931996 105.332 2.07199 107.612 4.35199C109.892 6.63199 111.032 9.36799 111.032 12.56C111.032 13.624 110.88 14.688 110.576 15.752C110.272 16.664 109.892 17.652 109.436 18.716L36.4763 172.616C34.0443 176.872 30.4723 179 25.7603 179Z';
const SEVEN_EXTRA_PATH = 'M25.7603 179C22.7203 179 20.0603 177.86 17.7803 175.58';
const HEIGHT_PATH = 'M53.6078 179.772C43.5758 179.772 34.5318 177.416 26.4758 172.704C18.5718 167.84 12.3398 161.304 7.77977 153.096C3.21977 144.736 0.939766 135.388 0.939766 125.052C0.939766 115.324 3.14377 106.584 7.55177 98.832C11.9598 90.928 17.8878 84.696 25.3358 80.136C20.1678 76.184 16.0638 71.32 13.0238 65.544C9.98377 59.616 8.46377 53.08 8.46377 45.936C8.46377 37.272 10.4398 29.596 14.3918 22.908C18.3438 16.068 23.6638 10.672 30.3518 6.71999C37.1918 2.61599 44.9438 0.563986 53.6078 0.563986C62.2718 0.411988 69.9478 2.31199 76.6358 6.26399C83.4758 10.216 88.8718 15.612 92.8238 22.452C96.7758 29.292 98.6758 37.12 98.5238 45.936C98.5238 53.08 97.0038 59.616 93.9638 65.544C90.9238 71.32 86.8198 76.108 81.6518 79.908C89.0998 84.468 95.0278 90.7 99.4358 98.604C103.844 106.508 106.048 115.324 106.048 125.052C106.048 135.388 103.692 144.736 98.9798 153.096C94.4198 161.304 88.1878 167.84 80.2838 172.704C72.3798 177.416 63.4878 179.772 53.6078 179.772ZM53.6078 70.104C59.9918 70.104 65.2358 67.672 69.3398 62.808C73.5958 57.944 75.7998 52.092 75.9518 45.252C76.1038 38.412 74.0518 32.788 69.7958 28.38C65.5398 23.972 60.1438 21.768 53.6078 21.768C47.2238 21.768 41.9038 23.972 37.6478 28.38C33.3918 32.788 31.1878 38.412 31.0358 45.252C30.8838 52.092 32.9358 57.944 37.1918 62.808C41.5998 67.672 47.0718 70.104 53.6078 70.104ZM53.6078 158.796C59.2318 158.796 64.2478 157.276 68.6558 154.236C73.2158 151.196 76.7878 147.168 79.3718 142.152C81.9558 136.984 83.2478 131.284 83.2478 125.052C83.3998 118.972 82.1838 113.576 79.5998 108.864C77.0158 104 73.4438 100.2 68.8838 97.464C64.4758 94.576 59.3838 93.132 53.6078 93.132C47.9838 93.132 42.8918 94.576 38.3318 97.464C33.7718 100.2 30.1998 104 27.6158 108.864C25.0318 113.576 23.7398 118.972 23.7398 125.052C23.7398 131.284 24.9558 136.984 27.3878 142.152C29.9718 147.168 33.5438 151.196 38.1038 154.236C42.6638 157.276 47.8318 158.796 53.6078 158.796Z';
const HEIGHT_EXTRA_PATH = '';
const NINE_PATH = 'M54.0998 0.703985C64.5878 0.703985 73.8598 3.05999 81.9158 7.77199C90.1238 12.332 96.5078 18.716 101.068 26.924C105.628 34.98 107.908 44.252 107.908 54.74C107.908 66.444 105.02 76.78 99.2438 85.748L47.4878 172.16C44.7518 176.416 41.2558 178.544 36.9998 178.544C33.8078 178.544 31.1478 177.632 29.0198 175.808C26.8918 173.984 25.5238 171.704 24.9158 168.968C24.4598 166.232 25.0678 163.496 26.7398 160.76L57.9758 108.776C56.7598 108.928 55.4678 109.004 54.0998 109.004C43.6118 109.004 34.3398 106.724 26.2838 102.164C18.2278 97.452 11.9198 91.068 7.35977 83.012C2.79977 74.804 0.519766 65.38 0.519766 54.74C0.519766 44.252 2.79977 34.98 7.35977 26.924C11.9198 18.716 18.2278 12.332 26.2838 7.77199C34.3398 3.05999 43.6118 0.703985 54.0998 0.703985ZM54.3278 21.224C44.9038 21.224 37.2278 24.34 31.2998 30.572C25.3718 36.804 22.4078 44.86 22.4078 54.74C22.4078 64.62 25.3718 72.752 31.2998 79.136C37.2278 85.368 44.9038 88.484 54.3278 88.484C63.5998 88.484 71.1998 85.368 77.1278 79.136C83.0558 72.752 86.0198 64.62 86.0198 54.74C86.0198 44.86 83.0558 36.804 77.1278 30.572C71.1998 24.34 63.5998 21.224 54.3278 21.224Z';
const NINE_EXTRA_PATH = 'M54.0998 0.703985C64.5878 0.703985 73.8598 3.05999 81.9158 7.77199';

class ViewBox {
  double width;
  double height;

  ViewBox(this.width, this.height);
}

class Digit {
  int value;
  Duration timeLeftBeforeDigitUpdate;
  double initialProgress;
  Path path;
  Path nextPath;
  ViewBox viewBox;

  Digit({
    @required this.value,
    @required this.timeLeftBeforeDigitUpdate,
    @required this.initialProgress
  }) : 
    assert(value != null, 'value is required'),
    assert(value >= 0 && value <= 9, 'value is between 0 and 9'),
    assert(timeLeftBeforeDigitUpdate != null, 'timeLeftBeforeDigitUpdate is required'),
    assert(initialProgress != null, 'initialProgress is required'),
    assert(initialProgress >= 0.0 && initialProgress <= 1.0, 'initialProgress is between 0 and 1') {
      String svgPath;
      String nextSvgPath;
      switch (value) {
        case 0:
          svgPath = ZERO_PATH + ZERO_EXTRA_PATH;
          nextSvgPath = ONE_PATH + ONE_EXTRA_PATH + ONE_EXTRA_PATH;
          viewBox = ViewBox(110, 179);
          break;
        case 1:
          svgPath = ONE_PATH + ONE_EXTRA_PATH + ONE_EXTRA_PATH;
          nextSvgPath = TWO_PATH + TWO_EXTRA_PATH + TWO_EXTRA_PATH;
          viewBox = ViewBox(60, 179);
          break;
        case 2:
          svgPath = TWO_PATH + TWO_EXTRA_PATH + TWO_EXTRA_PATH;
          nextSvgPath = THREE_PATH + THREE_EXTRA_PATH + THREE_EXTRA_PATH;
          viewBox = ViewBox(109, 179);
          break;
        case 3:
          svgPath = THREE_PATH + THREE_EXTRA_PATH + THREE_EXTRA_PATH;
          nextSvgPath = FOUR_PATH + FOUR_EXTRA_PATH;
          viewBox = ViewBox(115, 179);
          break;
        case 4:
          svgPath = FOUR_PATH + FOUR_EXTRA_PATH;
          nextSvgPath = FIVE_PATH + FIVE_EXTRA_PATH + FIVE_EXTRA_PATH;
          viewBox = ViewBox(136, 179);
          break;
        case 5:
          svgPath = FIVE_PATH + FIVE_EXTRA_PATH + FIVE_EXTRA_PATH;
          nextSvgPath = SIX_PATH + SIX_EXTRA_PATH;
          viewBox = ViewBox(117, 179);
          break;
        case 6:
          svgPath = SIX_PATH + SIX_EXTRA_PATH;
          nextSvgPath = SEVEN_PATH + SEVEN_EXTRA_PATH + SEVEN_EXTRA_PATH;
          viewBox = ViewBox(108, 178);
          break;
        case 7:
          svgPath = SEVEN_PATH + SEVEN_EXTRA_PATH + SEVEN_EXTRA_PATH;
          nextSvgPath = HEIGHT_PATH;
          viewBox = ViewBox(112, 179);
          break;
        case 8:
          svgPath = HEIGHT_PATH;
          nextSvgPath = NINE_PATH + NINE_EXTRA_PATH;
          viewBox = ViewBox(107, 180);
          break;
        case 9:
          svgPath = NINE_PATH + NINE_EXTRA_PATH;
          nextSvgPath = ZERO_PATH + ZERO_EXTRA_PATH;
          viewBox = ViewBox(108, 179);
          break;
        default:
          svgPath = '';
          nextSvgPath = '';
          viewBox = ViewBox(0, 0);
      }
      path = parseSvgPathData(svgPath);
      nextPath = parseSvgPathData(nextSvgPath);
    }
}