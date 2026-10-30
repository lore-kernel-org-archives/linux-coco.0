Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350417;
	b=I5ahDuJ+VQigTYTl5Uclrvv7na21JE6Q8AFbVcGkFz3GiPXMWQO6EWwbjA3LUwyQDZSK
	 ShCrcsyvW30C/bG0XzY79C26oZxBoXohP54ZQLLXh/cgGEzxCPj0nOQlNIVnc5IYkMvhk
	 CSS9r9njZnSS4wTJVpcHy6D0SkEa/V4XBv/ecCz8vFeFkCyqPkt/xuEb9pqJYnUIlAP40
	 mZ69tBhz6NHfGMhv0KQBOI/HS5+eGWjLl9Y82cRxUycNCtsBl8KNfr1CcUpcgG072nKP+
	 8MxQ94IM8tsqLSHeqYj2lBxJ6hD7+3S/RGhki5/g4SfJVnQqVhAAh91KMDZvdEzPl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350417;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MjlHxacTWfymNUEjYqS2vyxcVfxABqmAOY5x4NMgFWA=;
	b=p3cRxU5W36DgpEJVmjnfkFDlRusiDQBkBq4mgxNwLQ6hg89WDPO1Wp8ijik8pKkNYNEf
	 QfgSzbWAmwd37YXgHpQZvRBDXAihVCtoumfyT54aGJpTcOhhK6KISioSEg4/mmx0fOPTu
	 cgepC6R7GscrWo2tIxLHW3fgV7Qg4HhhWlpjUBvLfR6Y0i7kK5FUHj8qeq8D7zsbMTSPI
	 VyBNbCsdHjqeNy3t/79S9wCnD2c+H4MK9QOCmC88tQvQR5FxkWvms5SrgDIzEV6UJsNHL
	 53RyzheshldUKJ6fohfayu+5iFvM0N85cQx6TeK8u07ihRvp45Mw2Y+KN7m3ajBih5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LZQglaF5;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF0606A327
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 08:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CF0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LZQglaF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350416; x=1824886416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CEZ2wdOuODFkOO0fyvvu9cI2/azabmBxzCsHpSqWn0k=;
  b=LZQglaF5+GIaNMIj/jokaq2r0CLS7zj+2OCJLVX7irIHJEPYp9PjT7F/
   2WrxWzljvBvmPUnmUG276yjpbzXp8aAjv+beVhRg22+QlygFicfA+Qlnm
   3KAY0hkdDTLGTkrZ6Hz6TV+KnduN52L5K6GMyBGf44Q4V9D0pr+JcBPGC
   xP4VgetjUt6lXYFRR5JjrAFOFRb+Y6AJFUMV9XzgG+vFDOX5/K/qTeV88
   VWqffXhidWrFICdm20cwWA/EmCZeyJ89oIfuMTRpRnlTYM3xby6B2Uq+J
   3o5+expMFSlKyWj4AyuvnZ9LZDaQxUefIJvM9eWFGFpkhKrDQttqQwMiY
   w==;
X-CSE-ConnectionGUID: QDUiwgNHRcqS8+4dBZ3KvA==
X-CSE-MsgGUID: lOjN1zf8T2OaHfGxNcze+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2122569"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2122569"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:53:36 -0700
X-CSE-ConnectionGUID: sdRgKrIYT5iiGNL06L6Dgg==
X-CSE-MsgGUID: NCZ7NjqiTKW4s3nNhY/oiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7199512"
Received: from 984fee019967.jf.intel.com ([10.23.153.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:53:36 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: yilun.xu@intel.com,
	arjan.van.de.ven@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [RFC PATCH v1 1/3] x86/virt/seamldr: Allocate 'struct seamldr_params' after image validation
Date: Fri, 30 Oct 2026 01:52:58 -0700
Message-ID: <20261030085304.3886520-2-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261030085304.3886520-1-chao.gao@intel.com>
References: <20261030085304.3886520-1-chao.gao@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct seamldr_params' is the in-memory ABI the kernel passes to P-SEAMLDR
to update the TDX module. It has a fixed size and is allocated before the
update image is validated.

To support larger TDX modules, the ABI was extended to let
'struct seamldr_params' link to extra pages. The number of extra pages
depends on the module page count, which can be trusted only after the image
header is validated.

Move the allocation after the image validation in init_seamldr_params(),
so a later change can allocate 'struct seamldr_params' and the extra
pages as one buffer. Rename the function to build_seamldr_params() since
it now allocates and returns a buffer rather than filling in one the
caller provides.

No functional change intended.

AI was used to review the code and workshop the logs. It suggested renaming
init_seamldr_params() and updating the comments above it and at its call
site.

Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 arch/x86/virt/vmx/tdx/seamldr.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index b1137ca6150d..3513fd28536a 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -157,13 +157,14 @@ static void populate_seamldr_params(struct seamldr_params *params,
 
 /*
  * @image points to a vmalloc()'d 'struct tdx_image'. Transform
- * it into @params which is the P-SEAMLDR ABI format.
+ * it into a newly allocated 'struct seamldr_params', which is
+ * the P-SEAMLDR ABI format.
  */
-static int init_seamldr_params(struct seamldr_params *params,
-			       const struct tdx_image *image,
-			       u32 image_len)
+static struct seamldr_params *build_seamldr_params(const struct tdx_image *image,
+						   u32 image_len)
 {
 	const struct tdx_image_header *header	= &image->header;
+	struct seamldr_params *params;
 
 	u32 sigstruct_len	= header->sigstruct_nr_pages * PAGE_SIZE;
 	u32 module_len		= header->module_nr_pages    * PAGE_SIZE;
@@ -178,25 +179,29 @@ static int init_seamldr_params(struct seamldr_params *params,
 
 	/* Check the calculated payload size against the image size. */
 	if (TDX_IMAGE_HEADER_SIZE + sigstruct_len + module_len != image_len)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	/* Reject unsupported tdx_image ABI versions. */
 	if (header->version != TDX_IMAGE_VERSION_2)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (header->sigstruct_nr_pages > SEAMLDR_MAX_NR_SIG_PAGES ||
 	    header->module_nr_pages    > SEAMLDR_MAX_NR_MODULE_PAGES)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (memcmp(header->signature, "TDX-BLOB", sizeof(header->signature)))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	if (memchr_inv(header->reserved, 0, sizeof(header->reserved)))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	params = kzalloc_obj(*params);
+	if (!params)
+		return ERR_PTR(-ENOMEM);
 
 	populate_seamldr_params(params, sigstruct_start, header->sigstruct_nr_pages,
 					module_start,    header->module_nr_pages);
-	return 0;
+	return params;
 }
 
 /*
@@ -321,7 +326,7 @@ int seamldr_install_module(const u8 *data, u32 data_len)
 	int ret;
 
 	/*
-	 * init_seamldr_params() reads the header early.
+	 * build_seamldr_params() reads the header early.
 	 * Ensure there is enough data to do at least that.
 	 */
 	if (data_len < TDX_IMAGE_HEADER_SIZE)
@@ -329,14 +334,10 @@ int seamldr_install_module(const u8 *data, u32 data_len)
 
 	image = (const struct tdx_image *)data;
 
-	params = kzalloc_obj(*params);
-	if (!params)
-		return -ENOMEM;
-
-	/* Populate 'params' from 'image'. */
-	ret = init_seamldr_params(params, image, data_len);
-	if (ret)
-		goto out;
+	/* Build 'params' from 'image'. */
+	params = build_seamldr_params(image, data_len);
+	if (IS_ERR(params))
+		return PTR_ERR(params);
 
 	/* Ensure a stable set of online CPUs for the update process. */
 	cpus_read_lock();
@@ -345,7 +346,6 @@ int seamldr_install_module(const u8 *data, u32 data_len)
 				      cpu_online_mask);
 	cpus_read_unlock();
 
-out:
 	kfree(params);
 	return ret;
 }
-- 
2.52.0

