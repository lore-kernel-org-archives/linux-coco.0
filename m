Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319450;
	b=v/7UKDItiv8MXnup9e4d4TXuOZiCsn2QdavktD/dkWHMD8QoNnc+wNWHQNcD0a7zaoIX
	 G1rN9M5RmFkzHAIM8wv7Wx3E23P7YRoQ9xdy9jllM/5Pfh0z+et+7JzeZfBqASZt9vKtf
	 fSUks2qPdfjw5qkCt2rqHT4OOcCXtVchc0QXUqfDrwUzIoMQubNWOVC7rS+guvDj5fLTO
	 KPxKGc3alHBqZoX303CJXcD4bl33uL76fOBhudOK60WflV2UYQMNWi5F5JRJVIUfpB8O0
	 ZJOxlH7B+6argdeWp+uaPItoFbRyQkTRpjDWYjEYIHYPLkW3fnXCEIPfPKT6yQgGEXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319450;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=K5EnhnRA88GWc7NKadVmxiNMdMbACdMfjR5tfrqsDQQ=;
	b=bbMRRckOcwKgeohsBQC+PN37qV26wYHUtTKfks70pXeGuQH2Djz1G29q6LqIRrfpHCgV
	 7Bt7UvBHONxtCsxXCcoVGvs7disvs1pA3EQU2kT4IGbytC3nvgg0XTEUAIVIYUF9t0bdU
	 E8IOBGu0vFX6Vzz9isBH8ApXdBtKQWXh2pY0P7QcwLLR/7yMArRAXXnuyc5w82APbUbhQ
	 TLi/GLinWXCYftooMrb4Meacedtb1N9acwz8BwF1M172MLxdjUaXzpg0CiK3KmFDVrSUJ
	 rxvH9WqlXUb4MUMe0hu70ZJq0CUbmHXdOMOwLIY9SXFn/hmCoXkxTE2okJ26WjrZHyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="E6QjLs/j";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7A606A330
	for <linux-coco@lists.linux.dev>; Sun, 22 Nov 2026 03:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA7A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E6QjLs/j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795319450; x=1826855450;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=WSnI0fuzlcLmBWsud4Ap/Cbc62vFF+a3GpsYW9jGD5c=;
  b=E6QjLs/jlAnDZtWGmGGQsKH23U1e8uojSpxwrqGduc/HU9CwRIFylMXF
   nFtmYlDamPbTVsNY1J/GtGayFYXcmkI9jRTCsOvrt6oLi7V2MGuJJOZXi
   CnqU8mir54DwMAI9rWQ821i5PcMj/0Oui382uEfufV2KAuq+b8nK2Ev5b
   7JSWe3PCIu+WVfqm1eE6z5TvMZiy3mmFU9rlicGsUNglG7NGJ7fXHpwAD
   6USWU9sERd5RaXSLVC4BFRuGdT/H8Ud6C8we1kGpXvw6FRW8hQPxY/unl
   57wSKHkJVN/GdgqJFMrw2+0+MnE1rqRuAWktouurUYweBDK6RBYtGi8JL
   Q==;
X-CSE-ConnectionGUID: sL+O8Yn/Rxqb2/FNkCUtWg==
X-CSE-MsgGUID: QR52S5x5QSOlZAaGsOWUgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4164709"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4164709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 19:50:49 -0800
X-CSE-ConnectionGUID: scw4q4upThOpWvTqI5ZpuQ==
X-CSE-MsgGUID: mPvYgkQNSf+766xbxS+mQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11096971"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 19:50:49 -0800
Received: from [10.245.244.140] (abityuts-desk1.ger.corp.intel.com [10.245.244.140])
	by linux.intel.com (Postfix) with ESMTP id 375EC20B8CD1;
	Sat, 21 Nov 2026 19:50:42 -0800 (PST)
Message-ID: <d012c58931efa38a782ac3484ea930d05a6407a9.camel@linux.intel.com>
Subject: Re: [PATCH v5 2/6] x86/virt/tdx: Configure add-on features on TDX
 module init
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe	
 <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	dave.hansen@intel.com, kvm@vger.kernel.org, yilun.xu@intel.com, 
	xiaoyao.li@intel.com, sohil.mehta@intel.com, adrian.hunter@intel.com, 
	kishen.maloor@intel.com, tony.lindgren@linux.intel.com,
 peter.fang@intel.com, 	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 chao.gao@intel.com, 	nik.borisov@suse.com
Date: Sun, 22 Nov 2026 05:50:41 +0200
In-Reply-To: <20261111-tdx-module-ext-v5-2-c74f764abc3d@linux.intel.com>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
	 <20261111-tdx-module-ext-v5-2-c74f764abc3d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Yilun,

The patch looks good, but its framing can be improved.

Remove references to enabling all add-ons to improve it. This patch adds
plumbing, it should not dictate/discuss whether all or only some add-ons
should be enabled. See comments below.

On Wed, 2026-11-11 at 11:48 +0800, Xu Yilun wrote:
> The TDX architecture identifies some features that are off by default.
> They are classified as add-on features because enabling them affects
> existing TDX systems: they may change existing feature behavior, or
> reserve more memory.
>=20
> However, the impact of the first add-on features will be low enough to
> pursue a simple approach - the kernel just enables them when supported.
> If a feature with a very high overhead appears in the future, this can
> be revisited.

This sounds like all supported add-ons will be enabled for simplicity.

The reviewer keeps this in mind now.

... snip ...

> Pass the bitmap of features that are supported by both kernel & TDX
> module to TDH.SYS.CONFIG. Initially, the bitmap is 0. It will be updated
> to contain specific feature bits as full kernel support lands.

But this says that it enables no add-ons. Now reviewer needs to spend
brain cycles to process the contradiction, unnecessarily.

... snip ...

>  arch/x86/virt/vmx/tdx/tdx.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index c7bd0b01786d..3bfe78b4b538 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1033,9 +1033,19 @@ static __init int construct_tdmrs(struct list_head=
 *tmb_list,
> =20
>  #define TDX_SYS_CONFIG_DYNAMIC_PAMT	BIT(16)
> =20
> +/* List all kernel-supported add-on features0 bits here */
> +#define TDX_KERNEL_SUPPORTED_ADDON_FEATURES0	(0)

Suggested comment:

/* Specify add-on feature bits to enable=E2=80=9D instead */

I think that this patch should not dictate "all" vs "some", no need.

... snip ...

> +	/*
> +	 * Use SEAMCALL version 1 that supports add-on features if any are
> +	 * requested. Otherwise use version 0 for backward compatibility.
> +	 */
> +	if (addon_features0) {
> +		args.r9 =3D addon_features0;
> +		args.version =3D 1;
> +	}

Separate nitpick for the comment.

Suggested comment:

/*
 * Avoid unnecessarily requiring version 1 when no add-on features to
 * request.
 */

I was confused by "for backward compatibility=E2=80=9D, which sounds like t=
he
kernel or the seamcall falls back to version 0 if version 1 is not
supported.

Thanks, Artem.
