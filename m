Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425831;
	b=BOyAX/O3R7TSL/P1Xajt2Edv24jrbdmHNWK98UgpQljVJ7NFAfORV2OvBJb9wA1NbzeJ
	 SXlt+NfbvOgMTafBjUZPOtgfvEnIjTXGKHWiIarMVEWJkEZ7eJxqIy5gg3EBvEGOnjo0u
	 9r/qbe6PYGLuluPa7DKrb9RPjeF7nqgtCfzYpD0s+VidDwdicnZAWvZuJOLm2yAUioqr+
	 cMcm8oPyOSNLi8q3/CoqlgSDoJzCeNL7nDtjN7gP3pfhYaSCRX/G5w0PP3efd1oOGJe9B
	 VIa5vKwfKf/rmbQhElBCV9b0FmMKkEN2Gck/kuPzwaxrN9Q5Rw+CeFT/Mfp4EJ1El8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425831;
	h=Received:DKIM-Signature:X-Mailer:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=85zXwvzutIicpZmGHnHi9NFIRKU+Tk2QUsg8izhwHEw=;
	b=x08B6VDyDNQ2cNYHc3JW2+MOmzFt5QiCitgxUC7cIljKom0c2wPBlaQVMu3DAk/cTZdO
	 +jFCdMV9WRH2EeB2ELA3L8hsVQr5PIz6ephIfOsTQI6s3MxSJFKuO4skKtI5hgsL2VqTS
	 5VsC7Q/UrhAHhFmExnc7z7pXu5UikXsYMkEezRwxQlM9JfrQZDOgIwKlZR1drzz6WoLgz
	 tk0Pb6CzKvFivvwM3ox6FOYNuT85ReSyzwmgouOfa1YyLQI4Jam1F5Wh0LN0PQSD+CsBy
	 WXjv0+FbxBzKoA3S1N2jaeIiF40521DTJuKimpAVz1TlmqqtGv4uBzF1G11KAhEv3Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BReiUPrV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D2606A686
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BReiUPrV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500721F01567;
	Mon, 23 Nov 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425831;
	bh=85zXwvzutIicpZmGHnHi9NFIRKU+Tk2QUsg8izhwHEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BReiUPrVSNA+++viz4H2uVDmPcnu/rIcHwsRjBGSMvKBNvt1lZNlpqxznk6uETwva
	 5TKVQBiyPSyTytsB/igDtIHK0dLOFoZJeuL7B1ML/KjbVptTbX1jS1mOlfNb3w58Dj
	 PaSTSl4yma/yD3xUiI9lPSNiyuAYPhOjTX9RkA4oNOEGYo3hj78Cir3skfyutzmxlW
	 zuVIgbnC5dO3VwTa8KrxR2OsMHjMtm6GFI7eUvPMGIAmZqJ8bKKyNDa40brE3YQiR6
	 t0jzLbP1MHbFlUDVXhwSMyOi+e99nI8+QpcoKocg/YoX63C4MzLmUF2GObOt0zjvkq
	 voLxT889bQb/w==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Lukas Wunner <lukas@wunner.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
In-Reply-To: <20261120140412.GW2245175@nvidia.com>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
 <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
 <yq5ay0anwv7z.fsf@kernel.org> <20261120140412.GW2245175@nvidia.com>
Date: Mon, 23 Nov 2026 14:53:46 +0530
Message-ID: <yq5aa4mzrjdp.fsf@kernel.org>
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

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Fri, Nov 20, 2026 at 05:50:00PM +0530, Aneesh Kumar K.V wrote:
>> Alexey Kardashevskiy <aik@amd.com> writes:
>> 
>> > On 16/11/26 18:54, Aneesh Kumar K.V (Arm) wrote:
>> >> Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.
>> >> 
>> >> Cc: Alexey Kardashevskiy <aik@amd.com>
>> >> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> >> Cc: Lukas Wunner <lukas@wunner.de>
>> >> Cc: linux-coco@lists.linux.dev
>> >> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> >> ---
>> >>   MAINTAINERS | 2 ++
>> >>   1 file changed, 2 insertions(+)
>> >> 
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index ccbcdc0799b9..720fe907885b 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
>> >>   R:	Lukas Wunner <lukas@wunner.de>
>> >>   L:	linux-coco@lists.linux.dev
>> >>   S:	Maintained
>> >> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
>> >>   F:	Documentation/ABI/testing/configfs-tsm-report
>> >>   F:	Documentation/driver-api/coco/
>> >>   F:	Documentation/driver-api/pci/tsm.rst
>> >>   F:	drivers/pci/tsm.c
>> >>   F:	drivers/virt/coco/guest/
>> >> +F:	drivers/virt/coco/tsm-core.c
>> >>   F:	include/linux/*tsm*.h
>> >>   F:	samples/tsm-mr/
>> >
>> >
>> > I wonder if we can/should also do this now?
>> >
>> > +F:     drivers/crypto/ccp/sev-dev-tsm.c
>> > +F:     drivers/crypto/ccp/sev-dev-tio.*
>> >
>> > Or move the files but where, drivers/attestation/tio?
>> > drivers/attestation/amd? And the same question for ARM/Intel. And do
>> > these drivers/attestation/* become modules? Thoughts? Thanks,
>> 
>> We may want to consider this in the context of the full series. I have a
>> tree that includes attestation, guest_memfd, device trust, and iommufd
>> integration, with the layout below:
>> 
>>  drivers/attestation/cca/guest/spdm.c
>>  drivers/attestation/cca/host/spdm.c
>>  drivers/attestation/cca/host/vdev.c
>>  drivers/attestation/spdm/core.c
>>  drivers/firmware/arm_rmm/da-guest-rhi.c
>>  drivers/firmware/arm_rmm/da-guest.c
>>  drivers/firmware/arm_rmm/da-host-stream.c
>>  drivers/firmware/arm_rmm/da-host-vdev.c
>>  drivers/firmware/arm_rmm/da-host.c
>>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
>>  drivers/vfio/pci/vfio_pci_gmem.c
>>  drivers/vfio/pci/vfio_pci_gmem.h
>>  .../coco/{arm-cca-guest => arm-cca/guest}/main.c
>>  drivers/virt/coco/arm-cca/guest/rsi-da.h
>>  drivers/virt/coco/arm-cca/host/main.c
>>  drivers/virt/coco/arm-cca/host/rmi-da.c
>>  drivers/virt/coco/arm-cca/host/rmi-da.h
>>  drivers/virt/coco/arm-cca/host/viommu.c
>>  drivers/virt/coco/arm-cca/pci/guest-pci.c
>>  drivers/virt/coco/arm-cca/pci/host-pci.c
>
> It seems okay, though I wonder what pci/host&guest-pci.c is?
>


The host side handles:

1. Allocating the Root Port PDEV.
2. Allocating IDE resources for an external endpoint.
3. Connecting the firmware stream and enabling IDE.
4. Using a system stream for an RcIEP, without Root Port or PCI IDE resources.
5. Marking PF0 ready for device assignment only after setup succeeds.

The guest side handles:

1. Preventing PCI driver attachment.
2. Comparing the current RSI device information with the report and creating MMIO descriptors from it.
3. Validating the mappings.
4. Requesting RUN and marking the device as accepted.


Most of these are driven during evidence-accept, so the module
dependencies are (based on lsmod):

Host:
  arm-cca-host.ko
    +--> attestation-cca-host.ko
    |      +--> arm-cca-host-pci.ko
    |      |      `--> arm-rmm-da-host.ko
    |      +--> arm-rmm-da-host.ko
    |      +--> attestation-spdm.ko
    |      `--> attestation.ko
    +--> arm-cca-host-pci.ko
    +--> arm-rmm-da-host.ko
    +--> attestation-spdm.ko
    `--> attestation.ko

Realm guest:
  arm-cca-guest.ko
    +--> attestation-cca-guest.ko
    |      +--> arm-cca-guest-pci.ko
    |      |      `--> arm-rmm-da-guest.ko
    |      +--> arm-rmm-da-guest.ko
    |      +--> attestation-spdm.ko
    |      `--> attestation.ko
    +--> arm-cca-guest-pci.ko
    +--> arm-rmm-da-guest.ko
    `--> tsm_report.ko


Common attestation dependencies:

  attestation-spdm.ko
    +--> attestation.ko
    |      `--> ctlv.ko
    `--> ctlv.ko


>
> I kind of wish we had a directory called tsm too..
>
> drivers/firmware/tsm/ 
>
> Maybe?
>
> Can you be consistent with the cca/arm_rmm/arm-cca naming?
>

Will name it arm_cca ? 

>
> arm_rmm seems reasonable to me, the host tsm doesn't have to be used
> with VMs.

-aneesh
