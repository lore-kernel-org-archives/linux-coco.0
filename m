Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85E188907
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731420542; cv=none; b=Rd1DAg9O/G/TaXizm0Jxz0wK/vWJPElbn7qNDZz5skzdGfr8vh3HDt1VfwdbK2+t07JGXenH2+az4jfcWjTkkbQZ1v3PRwmujphx2EkwMRjPUbYiqrobt2ldBC686cMzC/aMy1bWfvy6UHCXIIlfFwXA3ebwfhMZASrcdmuh2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731420542; c=relaxed/simple;
	bh=z2GgRrZe65j+X0EfOtlHN3FnXHDPVC9GzEqvEqjhomE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiyjmMMPogx26p1PgnK9ii5UufX9TEhbUI1a0rVm89iQKToYRXewm6rr785Z5KHXkMBnCqzVAm1ag+Gq0UHF5/kmPUs6C/uQNaPu+aZP96Fekn38WvwZf2LXdOMkZLUnb3yYWxNaljCgxXnlZF9t/yJt7GfVIf4WHtakTR3iBYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3NtHFBi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3NtHFBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731420540; x=1762956540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z2GgRrZe65j+X0EfOtlHN3FnXHDPVC9GzEqvEqjhomE=;
  b=L3NtHFBiPGweEtFVByETOrGQMF79LYVoKG1dTIMzG1GHPwzWL9mrAlHE
   GzkE8MBaoVF2ivIFEdnjdwwhmArSaoKm3DM3vzDAEPgO7CmIBh+sunLX2
   WrO/CNav1xJcyRHuI5b8Sg4sgRa2pdjoPkvEkLSxBEgeUUwmops5GRSEG
   C3U8/JlKab+JJhL6gBa1b0iknmW6jwA3URqga5PxgH6yjFhYx0XK4Sbc8
   hNaxBxgMdGLVYfHQ4u/j7xcqEGa79IdjRVrjoKYpxMS4vxe4jEYsCIKI/
   Rz6VaXozqJ1hP7cVfgBQ8//AybPVy24DBBkl96D7zHkMxHCGYXxaAXY40
   w==;
X-CSE-ConnectionGUID: BYM7OtBTTWyS7QsXrAFInw==
X-CSE-MsgGUID: RIrxkNFhSQSUAtUfIAFJDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41817712"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41817712"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 06:09:00 -0800
X-CSE-ConnectionGUID: IDC/AicaQlS8Ta4m07fCXw==
X-CSE-MsgGUID: zOekt+EETG6DEFedC3oAqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87606121"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO himmelriiki) ([10.245.245.0])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 06:08:56 -0800
Date: Tue, 12 Nov 2024 16:08:48 +0200
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Lukas Wunner <lukas@wunner.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Subject: Re: [PATCH RFC v2 0/2] tsm: Unified Measurement Register ABI for TVMs
Message-ID: <ZzNhcHDzIIGi7fb6@himmelriiki>
References: <20241031-tsm-rtmr-v2-0-1a6762795911@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-tsm-rtmr-v2-0-1a6762795911@intel.com>


On Thu, Oct 31, 2024 at 11:50:39AM -0500, Cedric Xing wrote:
> NOTE: This patch series introduces the Measurement Register (MR) ABI, and is
> largely a continuation of Samuel Ortiz’s previous work on the RTMR ABI [1].
> 
> This patch series adds a unified interface to TSM core for confidential
> computing (CC) guest drivers to provide access to measurement registers (MRs),
> which are essential for relying parties (RPs) to verify the integrity of the
> computing environment. The interface is structured around

I think we also need think about the user ABI here. While there's a use
case for user components (running in a CVM) to read and evaluate the static parts
of the report, exposing them in a vendor agnostic way can be difficult.

Is it justified for the kernel parse the report details and make them available
or would it be enough to let users to parse TSM Reports @outblob based on @provider
info for the parts they are interested?

On the runtime measurement registers, [1] took the approach where only a generic
transport (same thinking as with TSM Reports) was provided and the proposed user
ABI was only the digest with a pre-configured target register index without any
vendor specifics.

> `struct tsm_measurement`, which holds an array of
> `struct tsm_measurement_register` and includes operations for reading and
> updating MRs.
> 
> The MRs come in two varieties: static and runtime. Static MRs are determined at
> the TEE VM (TVM) build time and capture the initial memory image or the
> configuration/policy specified by the TVM's owner. In contrast, Runtime MRs
> (RTMRs) start with known values, such as all zeros, at TVM build time and are
> extended with measurements of loaded code, data, configuration, or executed
> actions by the TVM guest during runtime.
> 
> Each `struct tsm_measurement_register` features a `mr_flags` member that
> indicates the MR's properties. Static MRs are typically marked as read-only
> with only the `TSM_MR_F_R` flag set, while RTMRs are marked as extensible with
> the `TSM_MR_F_X` flag. Patch 2 adds a sample module to demonstrate how to
> define and implement MRs.
> 
> MRs are made accessible to applications through a directory tree (rooted at
> /sys/kernel/tsm). An MR could be presented as either a file containing its
> value, or a directory containing elements like `digest` and `hash_algo`. By
> default, an MR will be presented as a directory unless `TSM_MR_F_F` is set in
> `mr_flags`.
> 
> [1]: https://patchwork.kernel.org/project/linux-integrity/cover/20240128212532.2754325-1-sameo@rivosinc.com/
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
> Changes in v2:
> - Separated TSM MR code in a new file: `tsm-mr.c`.
> - Removed RTMR event logging due to the lack of agreement on the log format.
> - Default presentation of each MR as a directory, with the option to request an
>   MR as a file using `TSM_MR_F_F`.
> - Reduced verbosity: Renamed `struct tsm_measurement_provider` to `struct
>   tsm_measurement`, and `tsm_(un)register_measurement_provider` to
>   `tsm_(un)register_measurement`.
> - Added `MODULE_DESCRIPTION` for measurement-sample.
> - Fixed several compiler warnings on 32-bit builds.
> - Link to v1: https://lore.kernel.org/r/20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com
> 
> ---
> Cedric Xing (2):
>       tsm: Add TVM Measurement Register Support
>       tsm: Add TVM Measurement Sample Code
> 
>  drivers/virt/coco/Kconfig               |   3 +-
>  drivers/virt/coco/Makefile              |   2 +
>  drivers/virt/coco/{tsm.c => tsm-core.c} |  26 ++-
>  drivers/virt/coco/tsm-mr.c              | 374 ++++++++++++++++++++++++++++++++
>  include/linux/tsm.h                     |  63 ++++++
>  samples/Kconfig                         |   4 +
>  samples/Makefile                        |   1 +
>  samples/tsm/Makefile                    |   2 +
>  samples/tsm/measurement-example.c       | 117 ++++++++++
>  9 files changed, 581 insertions(+), 11 deletions(-)
> ---
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> change-id: 20240904-tsm-rtmr-7a45859d2a96
> 
> Best regards,
> -- 
> Cedric Xing <cedric.xing@intel.com>
>

-- 
Regards, Mikko
