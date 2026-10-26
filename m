Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000425;
	b=EEmwz79OzfDX2VRUP+rFz97G/EHTUx50WbhHHOrvLAqoqPl0/0zz9Ik/3wwsTcRVFuER
	 updy3PEVObarg+O3dnBzWIVE6KvtK79oj2lr1O3YRJQzaSGg6KD/5sMfGAICzgeJXlMCE
	 kzTGrc2rb+dLmFSiHWn/4u5cKGjFFkV5N3/FPtISU/joB+U1aQr1DWfKWZkO1m5Wy3TAe
	 LNHOnsjR69wOq0+gcA6AqyFTXZ3stG2tOBhDobBhAg/rdktB0B8/EfRW4jcA95HxItGdQ
	 J0KnSWw/K/kFtcH0bgqNMCpD/LAQvfXifDmCG7rFS9JTyJ4DF0Qp3aH5GrvuWlGpe5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8T10hJCk/kOeswwpJvKXMYFyC3jypKOiaTvB8IF5Fd0=;
	b=2TOKWJeYOhy8oa9SKxmX9Hhurlrh9ZvWP1kDZvxGqUCT5d9E2/3QzTgx3YzTAMOMn0nx
	 hdBr1xAWhF+FW5/ZlBRKz8ZoRDuGZKwp5FKZ4yDKYA9m8e7o7M0Yzqji4jFa3cB5M9S5n
	 OdBqOuwJ0j6QHa9dn0w4mk6aMdOcj3hP/L7YODhNsNR60FPf4nv7XFHQUcCzoLhAwjeZ9
	 c5V9gPIhMtnVEixEFLmX22DRUK1hynP3Winja2m8fz0LmhFIqCfoE2FtAkZBWAdq8sJu7
	 lsUhcpYUr0WPD7I7Q86YtaAYkGFQ8o30iSITE9uDWnDOewd/T0fSGcHyjyi6Cd86I+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnbEAEi9;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F45606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F45606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnbEAEi9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793000423; x=1824536423;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FF+d8a+jtwAMDOrVTY9A6IFopNqIDLwibtD5Fx43VvI=;
  b=nnbEAEi9Inq56yugrWuqaObVZIhR6pGyACiWoT5EAgK5QC3kc2G5SyH4
   vgWvKiA4E1hWAcyVvaPXgC7VZCnyratx2d+FtC0gxbentZg4KuyKgpQ+V
   xwE3gw5ez//jJ9VS9duunTrXBW2m9y+M39zMEn1BzrpYvgcbW5bEpV3TI
   qNPRT96otXfOBF8ZBSt99tajJt65E+WR6PArrayVzWnGIUdZWuWQSeZMk
   8zFIT3ye26JEfWVWwbBItzOc9K5NQYWngwXvgmXVW6mhkPcQq6UBa1n62
   FVPAJgkM3dr+K9US1OqCYNcwiqKjk3kQRI21kv+7H3ih9FvPeCsAAtokF
   g==;
X-CSE-ConnectionGUID: gdMqpyo4Td6LVbj8mlM9zQ==
X-CSE-MsgGUID: RiwV6J1WQ6Oh3NHPBKBdwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1688867"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1688867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:40:01 -0700
X-CSE-ConnectionGUID: DjBsxKTBQXO/9JG9HEZ0+w==
X-CSE-MsgGUID: 6Yc3T8mTSw2tB+o/Hk3RNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4579501"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:39:57 -0700
Message-ID: <bc2fc3a1-b2e0-4262-bced-40211db5f0df@intel.com>
Date: Mon, 26 Oct 2026 15:39:53 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/15] x86/tdx: Add TDG.DMAR.ACCEPT module call
 wrapper for TDX Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-15-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-15-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> TDG.DMAR.ACCEPT updates the PASID table entry of the TDI as present to
> allow DMA access to the TD private memory.
> 
> For TDG.DMAR.ACCEPT, the R8-R15 input registers are reserved and must
> be zero. Use a zero-initialized argument structure with __tdcall_saved()
> so the complete TDCALL input register set is loaded with the required
> values.
> 
> Translate TDX module return codes into Linux errno values.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/tdx_connect.c   | 28 ++++++++++++++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  arch/x86/include/asm/tdx.h        |  1 +
>  3 files changed, 30 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx_connect.c b/arch/x86/coco/tdx/tdx_connect.c
> index 3ef10b1df401..a03b1da9a52a 100644
> --- a/arch/x86/coco/tdx/tdx_connect.c
> +++ b/arch/x86/coco/tdx/tdx_connect.c
> @@ -136,3 +136,31 @@ int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session)
>  	return tdx_mcall_tdi_to_errno(ret);
>  }
>  EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_start, "tdx-guest");
> +
> +/**
> + * tdx_mcall_dmar_accept() - Accept PASID table entry of a TDI instance
> + * @func_id: Function identifier specifying the TDI instance
> + * @target: DMAR target, 0 for non-partitioned TD or L1, 1-3 for L2 VM1-VM3,
> + *          other value reserved
> + *

Linux doesn't support TD partition and the next patch just hard codes it to 0.
We can drop it entirely for simplicity.

> + * Update the PASID table entry of the TDI to mark the DMA Remapping (DMAR)
> + * state as present, allowing DMA access to the TD private memory.
> + *
> + * Return 0 on success, -ENXIO for invalid operands, -EBUSY for busy operation,
> + * -ENODEV for TDI not present or invalid metadata, or -EIO on other TDCALL failures.
> + */
> +int tdx_mcall_dmar_accept(u64 func_id, u64 target)
> +{
> +	struct tdx_module_args args = {
> +		.rcx = func_id,
> +		.rdx = target,
> +	};
> +	u64 ret;
> +
> +	ret = __tdcall_saved(TDG_DMAR_ACCEPT, &args);
> +	if (!ret)
> +		return 0;
> +
> +	return tdx_mcall_tdi_to_errno(ret);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_dmar_accept, "tdx-guest");
> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index 90f2842f4253..01387f6b24b3 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -22,6 +22,7 @@
>  #define TDG_VM_WR			8
>  #define TDG_TDI_READ			67
>  #define TDG_TDI_START			68
> +#define TDG_DMAR_ACCEPT			70
>  #define TDG_MMIO_ACCEPT			71
>  
>  /* TDX TD attributes */
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index 787b3039ef5a..118cc58cc909 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -157,6 +157,7 @@ u64 tdx_hcall_tdcm(u16 devid, void *buf, size_t size, u8 vector);
>  int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *value);
>  int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa);
>  int tdx_mcall_tdi_start(u64 func_id, u64 exp_bind_session);
> +int tdx_mcall_dmar_accept(u64 func_id, u64 target);
>  #endif
>  
>  void __init tdx_dump_attributes(u64 td_attr);

