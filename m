Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872458;
	b=Wkz0jKQ4udCsxaWLlilsACAFyJ5E9PZ30VBq+xDjoaVr2hLxx5wHJR8byq6K5zC5Sgqg
	 h0KuM6LFFuANDOTiBuuWXYLIRinqH9OoL3+whRNHi+aFga4Ra3POyf8t6reuayudAUI87
	 RauuNV/7zRIQHBz+OsFr1IO/oD6ghP13XeQTTavdOVdCcOmx3ZdUChGrmNFPFX9DYCmZA
	 e64FVm5eTFdk3kmUOE2iv281yJ9N/okOSghVexZrUkCeWvil7bIPuWgNxdVQTnwumoNcb
	 ORxzNAH3VTF6BBZEuSfU+Mu9V7q8lLnKXXjITPdRw8vxqojhj3dOKDdWFa9p73sPnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872458;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=z/Mx7FrYRyjcMUQ7L/H2F9WrTTWfG8Nx8r2n762Dl3I=;
	b=jIydzoOX0jGmKFAPcqAZrUOuhv8Mi4EmTEsv5qOVYkwBaZLI6Ize0v6rIpYL9qKK+WEj
	 OwxCnJvmdRVNHv1iWT3H4nV9nlxODHuT93M7ansRFlxS8OT6T6R8Rm+WRQHYCvo1Bb9bY
	 fcnCa3/i3yf/O6JEiVRI2g0hzY1Ni644+ysolnB0oIG2OxzwN3gK+HVDgGneqJXa9chFy
	 UhMHuQAi6dYBIDj0ngIUbYcaqFjL0hJlDvvBvoJMt0K89mktLVDJAGQlFkq/wh89NXp1q
	 +IB7BBKuPctXdf6NSN+qKXHlJr8rNyoG+NsO7TsQVxC3WG0S+VGQC9jPckEe1DaDm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JoDOy79E;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AF606A31C
	for <linux-coco@lists.linux.dev>; Sat, 28 Nov 2026 13:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JoDOy79E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795872458; x=1827408458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YomhLU7Q+1ydoqrD0+PS6LLn+g7AH77gVzrh2Q31O8M=;
  b=JoDOy79EuhI5A4wcHZditl1y+PKl6wV1NCPqdEeu2uCNFLulxUaczOre
   kpTAks3uaxAGpS7/qKMzsMjF4FM4Xr9Vs69uYClM+wyOLo8/lTbzhJkVM
   vufVFzCROAPmbsycFzgaMZsqauX6EhGyJxCyid5gL6Vd7ZI7PXMXdFhz5
   6u1vuR5mB55dUhF2aOeupphJF6YhHlSw2X+MvV7HJ8mjeAjn6rPLmCwzD
   /35U0oUcikKlRrsUgWkXhNbTIOWR1N4ovH8//nwLgVmrwSIFX2gpElYxe
   zJIieZXHIxdr/w7gMtGHKEJC7g74Im6JBDVKlqkzpO/mpJxsfEheXlZ3d
   A==;
X-CSE-ConnectionGUID: hpNRsIBZSnqDTzF6licBrg==
X-CSE-MsgGUID: 0dBLroL2RJOeF2yyau2u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4765806"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4765806"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 05:27:37 -0800
X-CSE-ConnectionGUID: wnprmHliRYeeQrE5ZQ9RVQ==
X-CSE-MsgGUID: xlzUgupwT2qRFfp/6RsWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="14595601"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa013.fm.intel.com with ESMTP; 28 Nov 2026 05:27:34 -0800
Date: Sat, 28 Nov 2026 21:17:11 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	rick.p.edgecombe@intel.com, kevin.tian@intel.com,
	yilun.xu@intel.com, chao.p.peng@intel.com, baolu.lu@linux.intel.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [RFC PATCH 5/7] coco/tdx-host: Configure an IDE stream
Message-ID: <awrUV1hbcekti2ym@yilunxu-OptiPlex-7050>
References: <20261116111037.3478844-1-chao.gao@intel.com>
 <20261116111037.3478844-6-chao.gao@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116111037.3478844-6-chao.gao@intel.com>

> +static int tdx_ide_stream_setup(struct tdx_tsm_link *tlink)
> +{
> +	struct pci_dev *pdev = tlink->pci.base_tsm.pdev;
> +	struct pci_ide *ide;
> +	int ret;
> +
> +	ide = pci_ide_stream_alloc(pdev);
> +	if (!ide)
> +		return -ENOMEM;
> +
> +	/* Configure IDE capability for RP & get stream_id */
> +	ret = tdx_ide_stream_create(tlink, ide);
> +	if (ret)
> +		goto out_pci_ide_stream_free;
> +
> +	ide->stream_id = tlink->stream_id;

Nits:

Maybe we don't save stream_id in tlink, it can later be accessed by
tlink->ide->stream_id.

And the function could be like:

	ret = tdx_ide_stream_create(tlink, ide, &stream_id);

which aligns better with the comment "get stream_id".
