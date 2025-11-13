Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8087934B69C
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035461; cv=none; b=HuOivgsgcg5Q09PkIXJ0fxnFGdYzMASyivxv7rugz7x+28EIuzB75RJ6Z3IYsiqYaLnRSDzo4Dcs7f5m+fIQ9H6iWStcPkJESEvHepn10hCWa2WaK/Uf9rXlKlQJhjE1tpemDaW2Uq80YLpILXyl+wFctPjG49K91u8DXhS9N+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035461; c=relaxed/simple;
	bh=hozLaqRPP4hliFEC+8gb8RgILiPWL6kBTjMJS2Tagho=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iL8WRueb/QgbBvlFpcs4FJ0N4nXsJcPLONj6yLhBztWsDw8qVuG8ECsUGEnPlLnz3ZhoJwbS6qduOmzEQyweCwZQtPp3qY+BqyqOf31qi299cnvwu2xIQgUN29lfAhjOmMP4UmVRe6+J4i/msMGcKoIm6bVmOIAL38t4+MNRHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d6f7M2r27zJ468k;
	Thu, 13 Nov 2025 20:03:43 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7514C140277;
	Thu, 13 Nov 2025 20:04:17 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 13 Nov
 2025 12:04:16 +0000
Date: Thu, 13 Nov 2025 12:04:15 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>, Xu Yilun
	<yilun.xu@linux.intel.com>
Subject: Re: [PATCH v2 7/8] PCI/TSM: Add pci_tsm_guest_req() for managing
 TDIs
Message-ID: <20251113120415.000026cf@huawei.com>
In-Reply-To: <20251113021446.436830-8-dan.j.williams@intel.com>
References: <20251113021446.436830-1-dan.j.williams@intel.com>
	<20251113021446.436830-8-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 12 Nov 2025 18:14:45 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> A PCIe device function interface assigned to a TVM is a TEE Device
> Interface (TDI). A TDI instantiated by pci_tsm_bind() needs additional
> steps taken by the TVM to be accepted into the TVM's Trusted Compute
> Boundary (TCB) and transitioned to the RUN state.
> 
> pci_tsm_guest_req() is a channel for the guest to request TDISP collateral,
> like Device Interface Reports, and effect TDISP state changes, like
> LOCKED->RUN transititions. Similar to IDE establishment and pci_tsm_bind(),
> these are long running operations involving SPDM message passing via the
> DOE mailbox.
> 
> The path for a TVM to invoke pci_tsm_guest_req() is:
> * TSM triggers exit via guest-to-host-interface ABI (implementation specific)
> * VMM invokes handler (KVM handle_exit() -> userspace io)
> * handler issues request (userspace io handler -> ioctl() ->
>   pci_tsm_guest_req())
> * handler supplies response
> * VMM posts response, notifies/re-enters TVM
> 
> This path is purely a transport for messages from TVM to platform TSM. By
> design the host kernel does not and must not care about the content of
> these messages. I.e. the host kernel is not in the TCB of the TVM.
> 
> As this is an opaque passthrough interface, similar to fwctl, the kernel
> requires that implementations stay within the bounds defined by 'enum
> pci_tsm_req_scope'. Violation of those expectations likely has market and
> regulatory consequences. Out of scope requests are blocked by default.
> 
> Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


