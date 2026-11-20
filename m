Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177206;
	b=oaWbI7kStpzB06CHgWQPFKAY2QNEcTk4coryKN1mTBQnGwrcGC7Dcz6O4Q6GNZrIKhyQ
	 xiw55azI5RDhWuQbMXzsRKOc7/pWZSlSbuYqlRb2JEL/TxCQevtdtd3IJVzF60DPJDIvM
	 QydSM7PdjEfEtiPq+by2LotHP7hB465ZRr9RjCJc336KYVAV+mH4/TLURDUx+zYLPKbDa
	 hD4XvYadVPXPKIXvpb4mMR8jhV8Lq00thJMoRZkx/4J3ylxmJktYfMZFq0IGmzgu5nXbg
	 gS4FvEDebnkOUurJEvXwCVqtEoLaOb6cOEi8b6bUsHBjJqaDb4J8IXHLs5I4F9exeJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177206;
	h=Received:DKIM-Signature:X-Mailer:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=+ngl9qYP1mJ/p3E4dhpgzwOo+vTYtsohDcxU5oUIisA=;
	b=uSpihRMKH69RtDH7Dtz6bFQSa1gPfWPnT3fEMvjj82taLeGO0HC+u4hyPUL4FYynsY1Q
	 fCRhNYiBzuhlpbJyRxJ/ZDLqOuP7LZly2zJVTxtloxlHqdBjbDuskMAzIFwMzxKyOjAc3
	 CGD3eLa/i6DQ10QUNZO5TZ8w2n245BaErt43hMVJuwRA0JrNLUTl3XhasX6eEv/YOlNal
	 R7zGG90PWHwMgQLW2rZC0oBQi0TJA47I9d6ZvPC5uBSOjlPLHVq47IENQ5lsZ6vtxakiX
	 GDEL75g3S0iL6osxulSiSZ/ajLsfDrkAUGf8c1sxMZbaLt+OwRThdGRUbOpMUFcEgFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OnYokNT+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC65606A337
	for <linux-coco@lists.linux.dev>; Fri, 20 Nov 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OnYokNT+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA2B1F000C0;
	Fri, 20 Nov 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177206;
	bh=+ngl9qYP1mJ/p3E4dhpgzwOo+vTYtsohDcxU5oUIisA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OnYokNT+ClJKUNjU31Odr6uwIK3D/LZBcJGhe+3dva5cssxLGi3Eu6iEYrMcy8xH6
	 Wl9ElycyD4EpgYvyBDjzKwJg2aP/pc25Fp1skSyYiK+FdNIqrq4tqs3DUmNYjPAQcN
	 QVfo3yc8ICWDz1YCFQmKNWo97VSrHqEiNqk7var1KVHmedgyWolRZU2+QLVjvodmB8
	 WSMU7e7gy8EC6G0KYrguizlWv6DYVIBxhPCgLNxV3fn7KGcNh3UEE6frcg/q7I8b7h
	 phPQjOgGlipqU35g1XGNsWoeKeUAXdp9U6sPIB4Rowa0YpWhtymsTAdkEYT/5rXUya
	 eqxT6Wh/+LppA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev
Cc: Jason Gunthorpe <jgg@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
In-Reply-To: <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
 <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
Date: Fri, 20 Nov 2026 17:50:00 +0530
Message-ID: <yq5ay0anwv7z.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Alexey Kardashevskiy <aik@amd.com> writes:

> On 16/11/26 18:54, Aneesh Kumar K.V (Arm) wrote:
>> Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.
>> 
>> Cc: Alexey Kardashevskiy <aik@amd.com>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Lukas Wunner <lukas@wunner.de>
>> Cc: linux-coco@lists.linux.dev
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ccbcdc0799b9..720fe907885b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
>>   R:	Lukas Wunner <lukas@wunner.de>
>>   L:	linux-coco@lists.linux.dev
>>   S:	Maintained
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
>>   F:	Documentation/ABI/testing/configfs-tsm-report
>>   F:	Documentation/driver-api/coco/
>>   F:	Documentation/driver-api/pci/tsm.rst
>>   F:	drivers/pci/tsm.c
>>   F:	drivers/virt/coco/guest/
>> +F:	drivers/virt/coco/tsm-core.c
>>   F:	include/linux/*tsm*.h
>>   F:	samples/tsm-mr/
>
>
> I wonder if we can/should also do this now?
>
> +F:     drivers/crypto/ccp/sev-dev-tsm.c
> +F:     drivers/crypto/ccp/sev-dev-tio.*
>
> Or move the files but where, drivers/attestation/tio?
> drivers/attestation/amd? And the same question for ARM/Intel. And do
> these drivers/attestation/* become modules? Thoughts? Thanks,

We may want to consider this in the context of the full series. I have a
tree that includes attestation, guest_memfd, device trust, and iommufd
integration, with the layout below:

 drivers/attestation/cca/guest/spdm.c
 drivers/attestation/cca/host/spdm.c
 drivers/attestation/cca/host/vdev.c
 drivers/attestation/spdm/core.c
 drivers/firmware/arm_rmm/da-guest-rhi.c
 drivers/firmware/arm_rmm/da-guest.c
 drivers/firmware/arm_rmm/da-host-stream.c
 drivers/firmware/arm_rmm/da-host-vdev.c
 drivers/firmware/arm_rmm/da-host.c
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
 drivers/vfio/pci/vfio_pci_gmem.c
 drivers/vfio/pci/vfio_pci_gmem.h
 .../coco/{arm-cca-guest => arm-cca/guest}/main.c
 drivers/virt/coco/arm-cca/guest/rsi-da.h
 drivers/virt/coco/arm-cca/host/main.c
 drivers/virt/coco/arm-cca/host/rmi-da.c
 drivers/virt/coco/arm-cca/host/rmi-da.h
 drivers/virt/coco/arm-cca/host/viommu.c
 drivers/virt/coco/arm-cca/pci/guest-pci.c
 drivers/virt/coco/arm-cca/pci/host-pci.c
 
-aneesh
