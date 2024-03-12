Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E47BAE6
	for <linux-coco@lists.linux.dev>; Tue, 12 Mar 2024 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710255167; cv=none; b=PfD+kvp3yl2OX133vk51YaBmen1HWueOtX8of/PGqkn2M4g3rdXY4KTPeJs38yzYlfGb8HSOl8iUXImnkUpPL/FG1j6nm3x8HR9ZbZeWC9FYOR7JylK3Ku8nNAT6P4NGYUe2VXZi9saXzx80ej7c917DzBvNhnqr+lDPJPHkAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710255167; c=relaxed/simple;
	bh=hcVQn7I4DVIFWHwTEXd0MZq0+Qko6RLpLkLPp0r0R+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qX9REcJRcuHKKF0fxa4u6o8U6cFR0DSZR/rjC9LdrPGLA3CgHq6FdXXzSsdKptP6v1lsqv8Ap0VWVhArx1wMCkcIFzqBTaQowJMojlH1qv4BAU2oCO/Yf8jyuEBrkZCJK+NSM3IwJrBC3kSNijAAUHqJ42GnMk2n7wJK61YJ4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNSads/v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNSads/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710255164; x=1741791164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hcVQn7I4DVIFWHwTEXd0MZq0+Qko6RLpLkLPp0r0R+E=;
  b=jNSads/vOMf8eOHlOoe/GIXnzXMey3rWCs7HmkCOI9IetKHdYkW5FzLT
   4ibWdt1FEsE+prOBnTtLGLgL6oQYjXBvEtVpAAPmDvhYhe3ks2PgLyNdc
   90EU3R2HLJLGBFTqdztvOVvHb2jr6pFNujVz9GZORktjLzC/KrvUpTUoM
   cN5K38NGwdEb3eIIe+LOuyjHGIs30Jxzy7NC6FdMRXrm+ZGUqzp/zv8ei
   x0AEncKFxrLv13b2BIqi09EN/rUENjnSlct4a16eCXCgv++Y6/uRcBsAh
   p8X8eCPa0KqYbhGyJb+gIx9uuZEVAgNK9chTtFwZQWHMu0v6xc+ejebGS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8786002"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8786002"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="937051896"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="937051896"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2024 07:52:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 4B7D12B7; Tue, 12 Mar 2024 16:52:38 +0200 (EET)
Date: Tue, 12 Mar 2024 16:52:38 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: mhklinux@outlook.com
Cc: rick.p.edgecombe@intel.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, gregkh@linuxfoundation.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	netdev@vger.kernel.org, linux-coco@lists.linux.dev, 
	sathyanarayanan.kuppuswamy@linux.intel.com, elena.reshetova@intel.com
Subject: Re: [PATCH 0/5] Handle set_memory_XXcrypted() errors in Hyper-V
Message-ID: <fvtb2pwt2gzeottujs67kw3psxxjqrp6j2n6jeqiiqnsrhw4kg@til7ozahrbbm>
References: <20240311161558.1310-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311161558.1310-1-mhklinux@outlook.com>

On Mon, Mar 11, 2024 at 09:15:53AM -0700, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> Michael Kelley (1):
>   Drivers: hv: vmbus: Don't free ring buffers that couldn't be
>     re-encrypted
> 
> Rick Edgecombe (4):
>   Drivers: hv: vmbus: Leak pages if set_memory_encrypted() fails
>   Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
>   hv_netvsc: Don't free decrypted memory
>   uio_hv_generic: Don't free decrypted memory
> 
>  drivers/hv/channel.c         | 16 ++++++++++++----
>  drivers/hv/connection.c      | 11 +++++++----
>  drivers/net/hyperv/netvsc.c  |  7 +++++--
>  drivers/uio/uio_hv_generic.c | 12 ++++++++----
>  include/linux/hyperv.h       |  1 +
>  5 files changed, 33 insertions(+), 14 deletions(-)

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
