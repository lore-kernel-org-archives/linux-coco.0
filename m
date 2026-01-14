Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD312E11A6
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356487; cv=none; b=dp/exz7L+Lfz6BFJcP/3KODEwcFGnR1gDe4vGgbvDnlTvXeBbSZY7zsDvfrJpyD31YmxFykjGzHisr7sUgUTX1xWcifhzEUXz6T9EbylDbpP8HvE8kg+tXSrVbg4YoGju1ZNq3eKOf6x9tiI8Rr/JU1DFqBbM+fgVtD3l5DDqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356487; c=relaxed/simple;
	bh=Hpqi5Vl+v5DEWPwu4o1nxlcyigd/ZJ7W8Qxg2+iqdDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRvEu6ekx0pTz4F7b/59hOhVsUrBCte5K1jeg8GbKCook6GvQmYRbf8jETYvfJsDCn7fMJRvQpPpzAOsdf1iwj6l2dcw3Gy1r7RCuLp3MBMSxRIq59OaXT2SDalzZJ0xk2K4nPjmkywIlW8/V85Z9cF8/2zWhxLbCu45yCwYWlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lt+uQKxU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lt+uQKxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768356486; x=1799892486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hpqi5Vl+v5DEWPwu4o1nxlcyigd/ZJ7W8Qxg2+iqdDc=;
  b=lt+uQKxUzpS6urt/t1kLOOk5aZzYdYcI1vpOnmFSPcVwNszxsFk02EvT
   CILxD105ekrWuCsicfRdGQEkdOlA0AGnv5MnT+tTRM2VuP8TXa3FcCgME
   ksCNYgx4/3kHk6/b9YMYRi1tAJa4THw1rlSolw3yRKjnBg3tKcnmyBZ/h
   SRFWBIB9NtDiszb/cJJt4wvF7q8dIEYzUgGdSzQ17Y+xjhlyGh8T3R1bB
   aqlfqh2JvZnsiBccCqG/cGTO4c8w3eteCvrxQgsWVaFXeYHzMwN6Jj+1J
   M57MAL4Drt4LQzW+io5vUoLdc/8ZfNpzK50MIfankUmEtrTzG1DV6OGE2
   g==;
X-CSE-ConnectionGUID: gRaJujDHS26p9w8v1JKL2A==
X-CSE-MsgGUID: YM9IpD7SRv2Wkrac+asVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80300659"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80300659"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:08:05 -0800
X-CSE-ConnectionGUID: +XXfHjuHQJS+xpmV7UOjug==
X-CSE-MsgGUID: 0ZZtXq26RtKTFsOJefirWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204182688"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 18:08:02 -0800
Date: Wed, 14 Jan 2026 09:50:33 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 07/21] coco/tdx-host: Expose P-SEAMLDR information via
 sysfs
Message-ID: <aWb2aW063ADCxUyd@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-8-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001025442.427697-8-chao.gao@intel.com>

On Tue, Sep 30, 2025 at 07:52:51PM -0700, Chao Gao wrote:
> TDX Module updates require userspace to select the appropriate module
> to load. Expose necessary information to facilitate this decision. Two
> values are needed:
> 
> - P-SEAMLDR version: for compatibility checks between TDX Module and
> 		     P-SEAMLDR
> - num_remaining_updates: indicates how many updates can be performed
> 
> Expose them as tdx-host device attributes.
> 
> Note that P-SEAMLDR sysfs nodes are hidden when INTEL_TDX_MODULE_UPDATE
> isn't enabled or when P-SEAMLDR isn't loaded by BIOS, both of which

I don't think we need to worry about whether P-SEAMLDR is loaded or not.
The tdx-host device exists only if TDX Module is loaded, and in turn
P-SEAMLDR is loaded.

> cause seamldr_get_info() to return NULL.
> 

[...]

> +static ssize_t seamldr_version_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	const struct seamldr_info *info = seamldr_get_info();
> +
> +	if (!info)
> +		return -ENXIO;
> +
> +	return sysfs_emit(buf, "%u.%u.%u\n", info->major_version,
> +					     info->minor_version,
> +					     info->update_version);
> +}
> +
> +static ssize_t num_remaining_updates_show(struct device *dev,
> +					  struct device_attribute *attr,
> +					  char *buf)
> +{
> +	const struct seamldr_info *info = seamldr_get_info();
> +
> +	if (!info)
> +		return -ENXIO;
> +
> +	return sysfs_emit(buf, "%u\n", info->num_remaining_updates);
> +}
> +
> +/*
> + * Open-code DEVICE_ATTR_RO to specify a different 'show' function for
> + * P-SEAMLDR version as version_show() is used for the TDX Module version.
> + */
> +static struct device_attribute dev_attr_seamldr_version =
> +	__ATTR(version, 0444, seamldr_version_show, NULL);
> +static DEVICE_ATTR_RO(num_remaining_updates);
> +
> +static struct attribute *seamldr_attrs[] = {
> +	&dev_attr_seamldr_version.attr,
> +	&dev_attr_num_remaining_updates.attr,
> +	NULL,
> +};
> +
> +static umode_t seamldr_group_is_visible(struct kobject *kobj,
> +					struct attribute *attr, int n)
> +{
> +	return seamldr_get_info() ? attr->mode : 0;

I feel it is a little wierd here, need some explaination why use
seamldr_get_info() for visibility. At first glance, I get the impression
that we don't expose the attributes on 1st seamldr_get_info() failure,
and if 1st read success we expose the attributes, then we return read
failure on 2nd seamldr_get_info() failure. That's the motivation I'm
trying to make the logic simpler.

As you said, the purpose of using seamldr_get_info() here is for the 2
checks:

  1. If INTEL_TDX_MODULE_UPDATE is selected.
  2. If P-SEAMLOAD exists.

But P-SEAMLOAD must exist in tdx-host device context. The chain of
dependency is P-SEAMLOAD->TDX Module->tdx host device.

So the logic could be simplified as "if INTEL_TDX_MODULE_UPDATE
selected, expose seamldr sysfs". A common practice maybe:


#ifdef INTEL_TDX_MODULE_UPDATE
> +static struct attribute_group seamldr_group = {
> +	.name = "seamldr",
> +	.attrs = seamldr_attrs,
> +	.is_visible = seamldr_group_is_visible,

drop is_visible()

> +};
#endif
> +
> +static const struct attribute_group *tdx_host_groups[] = {
> +	&tdx_host_group,

#ifdef INTEL_TDX_MODULE_UPDATE
> +	&seamldr_group,
#endif

The #ifdef should be added for several places, which seems annoying but
may be fine for the first optional feature. Later, could solve this by
splitting the file into tdx-host/main.c tdx-host/update.c
tdx-host/connect.c ...

> +	NULL,
> +};
