Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C93368AE
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684987; cv=none; b=Tn55dn41p7ha6Jj95wnhpejnhHc9uwzSu/fxLTD8NbQrZDxe8RCr7N2W7oNfQ/rRlvPnDPBz382QSm102E7KMemFfuBNMvNw6irtwTe3Uey6MR/AL5GNyX9x2R1UyAOMqHYIVaVpfgwgX7TUvBuREmz/8/8+tX5Z3QUT1tW2agE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684987; c=relaxed/simple;
	bh=6Chbtbh91JQswn6MUozfrBBtYQHYxdhIh4GFF8DHSbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrp+EKVDEgdSWxhN5RzQo0KEMshtmGEjlClK82+NtAhKGCom3Zv5ST0IbM/Tk1lnOhT16pDwUT6aGr00pzwfWip0UKTWavhN3RLVzQ+/+fGzqr5n5R3gTfcl5XZbGz1f9GvM7FTdRYxmsjrefIdoERb8dnjhV9nMJ+4iI53Da+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ3869GP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ3869GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772684985; x=1804220985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Chbtbh91JQswn6MUozfrBBtYQHYxdhIh4GFF8DHSbQ=;
  b=HQ3869GPjggvlMQsiycPuE6AVxVXcAGMkQOHgOn5NlyAVE4MXZKjC559
   ZHYVmesYL+ARbsS5lXrTrjM9g0koQB+2w3Q4HZM7ZyIlz0O/F4OOmuZKU
   K20SaKnj8vNeWSfqGzTXs9GSOPcqG4yEb9bLSDFVSRGK98yNJeR2iMwV8
   H/3rLrYFoG+/pAr9wlXVAW/PlyT/BoYRSEcMDpmt2ARhv32lRHCNmoE7G
   VZ7u8Mphe+xgF6ayCdUDLfsTaCStB4oLXVbnHyRbKz+dL0q4XQQy3fENG
   4AlbkCTkvKMP0bKUuss8XeyUwzxAqyUOP7rut4g5OLNjedy6K2N5i636t
   Q==;
X-CSE-ConnectionGUID: w8AJ5ZZMR0yBK93w/sI5Eg==
X-CSE-MsgGUID: QRBVolQqQryDMWWSvm5h/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85233156"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="85233156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:29:45 -0800
X-CSE-ConnectionGUID: s4U3BI54Sk6/QBIZSOJy4g==
X-CSE-MsgGUID: 0fsv4OblQDKlhJeyEOmozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215836413"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 20:29:39 -0800
Date: Thu, 5 Mar 2026 12:09:46 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	sagis@google.com, vannapurve@google.com, paulmck@kernel.org,
	nik.borisov@suse.com, zhenzhong.duan@intel.com, seanjc@google.com,
	rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	binbin.wu@linux.intel.com, tony.lindgren@linux.intel.com,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v4 09/24] x86/virt/seamldr: Check update limit before TDX
 Module updates
Message-ID: <aakCCudhc/P+4cJh@yilunxu-OptiPlex-7050>
References: <20260212143606.534586-1-chao.gao@intel.com>
 <20260212143606.534586-10-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212143606.534586-10-chao.gao@intel.com>

On Thu, Feb 12, 2026 at 06:35:12AM -0800, Chao Gao wrote:
> TDX maintains a log about each TDX Module which has been loaded. This
> log has a finite size which limits the number of TDX Module updates
> which can be performed.
> 
> After each successful update, the remaining updates reduces by one. Once
> it reaches zero, further updates will fail until next reboot.
> 
> Before updating the TDX Module, verify that the update limit has not been
> exceeded. Otherwise, P-SEAMLDR will detect this violation after the old TDX
> Module is gone and all TDs will be killed.
> 
> Note that userspace should perform this check before updates. Perform this
> check in kernel as well to make the update process more robust.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>

Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
