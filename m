Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2832570
	for <linux-coco@lists.linux.dev>; Thu,  7 Apr 2022 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649354704; x=1680890704;
  h=message-id:date:mime-version:to:from:subject;
  bh=OMYtNV9YLBO1nbB4iR+b2OeKXJ/qOWOvWNZ+lp2E3Ig=;
  b=S5CeMdV5TffrZOcQOeOJACJR95wryWuH832a3n9lnX/bMtDgMtHk31Vz
   N1Xns613DoNt82EQzTydTw9NqCXXYWivpY2XkBQPkVOFbtqNtAEGYo9py
   z+YceUD5cbJLniVWrdXMIgbCA7+MugIbV7pUPhklESPQ07qDlXtMVH7pG
   +fNADIsJSBv1k+DjqkJ3/41xWK+TcnM45Yij9k1DZkVljxiNHL7pxrBFm
   NmQwM40vgzBerPiHKRTNJUGZbhU8OjrunyzTLCrcKymHPlnax4asDrv51
   YrraRvw+dYzzFPrLpQl6wIFbbin7phlzRxm4EgOgcBSg9GlOVbas86p3i
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="324561179"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="324561179"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 11:05:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="659165757"
Received: from okathe-mobl.amr.corp.intel.com (HELO [10.255.228.211]) ([10.255.228.211])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 11:05:03 -0700
Content-Type: multipart/mixed; boundary="------------6aXMC7P8da5E4fVbJPIM7PUy"
Message-ID: <15499854-3806-3333-159b-56e8f494cf17@intel.com>
Date: Thu, 7 Apr 2022 11:05:07 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: linux-coco@lists.linux.dev, "Shutemov, Kirill" <kirill.shutemov@intel.com>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Subject: x86/coco MAINTAINERS mailing list

This is a multi-part message in MIME format.
--------------6aXMC7P8da5E4fVbJPIM7PUy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi coco folks,

There are some x86-specific "coco" additions being proposed here:

> https://lore.kernel.org/all/b43720c6-0763-f4bb-64a0-7745c6ad920a@intel.com/

that we're thinking about merging some time soon.  They add some
"arch/x86/coco/" files:

>   arch/x86/coco/Makefile                   |   2 +
>   arch/x86/coco/core.c                     |  22 +-
>   arch/x86/coco/tdx/Makefile               |   3 +
>   arch/x86/coco/tdx/tdcall.S               | 204 +++++++
>   arch/x86/coco/tdx/tdx.c                  | 692 +++++++++++++++++++++++

It would be nice to have a MAINTAINERS entry for these.  I know this
list is ideally arch-agnostic, but would anyone mind if it is listed as
the x86/coco mailing list?  Maybe something like the attached patch.
--------------6aXMC7P8da5E4fVbJPIM7PUy
Content-Type: text/x-patch; charset=UTF-8; name="x86-coco.patch"
Content-Disposition: attachment; filename="x86-coco.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZmQ3NjhkNDNl
MDQ4Li5mOGZhNDc4NmNjM2QgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5U
QUlORVJTCkBAIC0xMDgwNyw2ICsxMDgwNywxMyBAQCBGOglhcmNoL3g4Ni9rZXJuZWwva3Zt
Y2xvY2suYwogRjoJYXJjaC94ODYva3ZtLwogRjoJYXJjaC94ODYva3ZtLyovCiAKK1g4NiBD
T05GSURFTlRJQUwgQ09NUFVUSU5HCitNOgl4ODZAa2VybmVsLm9yZworUjoJS2lyaWxsIEEu
IFNodXRlbW92IDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgorTDoJbGludXgt
Y29jb0BsaXN0cy5saW51eC5kZXYKK1M6CVN1cHBvcnRlZAorRjoJYXJjaC94ODYvY29jby8K
KwogS0VSTkZTCiBNOglHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgogTToJVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgo=

--------------6aXMC7P8da5E4fVbJPIM7PUy--
