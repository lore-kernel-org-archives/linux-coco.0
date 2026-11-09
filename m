Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794262813;
	b=v1QeZch5U7iQEQn5R4JUj+jTIeAIJCySExSQFV2VqwisMnwkSpsq2PltZD7xIFtSnTk1
	 XtG2X1ZTfJijqOxvHwO6wkmnKrLHy1yN3llvk63azRQs6eBkCrYrnAx1o1Lge1XkNeBOu
	 FRjLBHFfq1aIHrNJ8LCbu4+n5mM7RnGSASSB96wBYCh0rgAs/IiLGn5uDKthjQWTMv2y+
	 yj7a+BbCEUMX/YE4jBzLVN0cOFSS/F6V/lLdQ/zfi/yrlIQHQu5uemCxwLPtH/8eySmkN
	 rqDl47KOuWaBcIJVGI3OUI266oU6cC0BII4ILNCA3bTjCd4/qCUiFr+jUaoLwRVn0YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KfoXHxmDBEItkaa6hcxF0A8t0fZTG3DLVeoM83AlVUQ=;
	b=SYtWTBeaQr6u57wbwvJ0sBWKbQylPv5otOUgihdvdPAv2Ox1HmcDAzJxacOYAAd6S5lj
	 QPcs75+FFwaOVplIvR7BFmbsu9kNYOOSpGNciIk6GQcEwojk2rQ+p999T2hNj43I5Ph5V
	 +AvviTH0A0VSCsXefuHJjyexdeuF35wHJCIAq0teAUPSTRdWJ1NfFYouTli5dvknutjE2
	 2ujk4N+GxAiA2E7lGC1FHq0nrq1WFHL7MvO2DeJfubk3Iw8KowEy4Z4BMiv+Dzr6/D1M/
	 HwI3TxFOspZxqTGV5CPCU79bprWRIZTQUcyxuwXvgdN9HziV1GpF9RIrYh3TZ9YPbNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKNV4H1x;
	arc=fail smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6BE606A332
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 22:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6BE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKNV4H1x
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e98301805so14130426d6.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 14:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794262812; cv=none;
        d=google.com; s=arc-20260327;
        b=WixhxnTF2RbP1eKu5eImJgxGuby6AbsxGk+NgwV9NfLCKuFAniFS3N3bHT/eval5of
         73Lui1V34P+3BXAO5XdZM2Mu0tSb5dfqmdD+CNVYDKSLIbevXxE2Snd7qTGE7pmZtGkO
         jdpMy+LUC94RBdr2IlpMiP0UhofWAD9qGf9wXbfhxTWhofLcDULjLwZZbxfdLF2ri2XT
         10KRIXNxO8u/PB8q6B8uxXpypQM3HDLiAfpnafy2qF4h/ZsfM3Q899cXANSSLjLKUyVg
         RsjtCx3aYNMsyloY/T8IrAv+p26qWTT0SqEMCtWWTRVfhCzipYpUgUbuT14ivTAAGkAw
         t+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KfoXHxmDBEItkaa6hcxF0A8t0fZTG3DLVeoM83AlVUQ=;
        fh=qEpS8yJZhJ9GvyXdHjcGlyvM4qn41URTPi2fwTW+zso=;
        b=YbPQOEv/vjvxYEJ6rxS+6LbvQHxAkXqJW49KG9Xqtet2fDrCmmzVvjH1yVrBWmPePz
         7BK2LalPekbOQ7sxrN+6MvN8aFt9U3MCFwKddHDqH1dEDgJZ66oT+Siw+Ki985HHK9jL
         H+9YpueDKOm124BgkOVaoQQuZC2aukWeiwoKXcQWooEiYqhi8jcc/FodOaVQQUk7b8QF
         NqzBOU+0oYEY8jslzoRR1OQl07jXjOison5uahjC4zVMfzjU4hWQQ+B1DNIFXgr372B2
         6rBeABIWT9rUQMxqwww5TPToduuYMMK7PiM2AL2zFpqcH6iGEMSCF8xrlCuQW6zaIXKL
         puHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794262812; x=1794867612; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfoXHxmDBEItkaa6hcxF0A8t0fZTG3DLVeoM83AlVUQ=;
        b=WKNV4H1x/tAD+zTkrybKKlp64hrXZod/25kQICYaVl6bVkQDQr8Tm6IE+YKcQIbiST
         KOJoixTwN9ykt+RCk3Md5tHCgTdIC568HgkfHpDB4Xn8HwUxcd2hoVJgbGHyWXUlxdkD
         59j6bRVN5HHHYA94CigNvelAoUUw1IkM0AGOIejgqbeauduJuOdZ5BOyc44AyL9OQvDT
         JStZOE83iIXm3H+QkV4q128JP1AJjPbeCDndRuu12wRBATzH6z4Z7wSFVhi3iySU5l7m
         PecoKqN3zKPQkwGVFvRnuy2JnnmHrDOFgYInLfWmKvpF0QcABSC9YiURY8T7ljEvYT1H
         Wi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262812; x=1794867612;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfoXHxmDBEItkaa6hcxF0A8t0fZTG3DLVeoM83AlVUQ=;
        b=hg7ktRiVhLmXbFpcWPYpowNoABNpJIEPQhCM4KzZh4G4wAgt2JEtzQr/TB2A/IhCBx
         GnBbyj0Ie2NCxYMsjcqCprIGYU4fD8069L9lekwW9ieyi+5k2T+2uHSWjReT6p9Y8iAY
         Zs+yzHWGZf+CfjacVWhml+NOGQSD0dnZkDYc1lX57T8JDHUUmBHfvG5jOX5BUQZNj+H3
         l3EkkGKe6ivH4Gngkz5ucSn18n7xGlG4uI4ha65Ll4WcKtSxW1oL2Wvlj4zCKj5rDcXs
         33zAPTccQs4aTsqqHPIRgyBu4vtLmjH5a7/PiV+CqAyrwRJOQQIccGo6FTuHPURMCyIL
         Z+MQ==
X-Forwarded-Encrypted: i=1; AL+hErGYexu+lcbj9zxWMsYfE8L6Cj0KDPSvYqBYzCoJLzRk4thycKLcMKLWtBaeHVxDN/3s1hF4lo4yDkiW@lists.linux.dev
X-Gm-Message-State: APuU4Z8dgUWKL8pPg3k63Bae1WIOJheK8l3ngQaPtcrxJllxCDP21q2W
	IiCG4RPlck1lrWrXYpW7hHdXZNhzRxdyztalDTwkF+5ogDn6Ujxsty2rPalfKtGEsSwTkZfRynu
	0w9E3jpqU8FAAWOHJVxBaealcFEB+11zSR64uVkO4
X-Gm-Gg: AYBFou0AmvEbeyu557IaTYh3iZSWrZk9Q0bEIJzZCi4BAYcFtMxHlbep2kqMaspw0rQ
	Dn4zpyB67c5snFaolcc3W99LQIODkASkVgRuhoVbt1uzSv+UFnjS+HRSPSKvuj7jM5N9yWCUqXT
	9v9W38OCxNh4aAFOBACfmXCkKn3j3h9m9mmRCUuV+HxjVBVIKA4MJkBc4TQVehWJuhoFx2frs5U
	B7cNmlEzvZqdWBz/L9323AnAaxJGjk2A8SariLEOa/xkVgsWliI4aj/sRF6tx1kGb98VfHhTcZO
	eTuE4oS1ZYLsvQsi4P+HruxIp0+l3/vxTnsDqVjwLVtD0hRRJPzbTPt/AIJOlkUkJjr2wg5o//i
	XzMf/OmWXmAUF/RgyCrLAtZBP+wf4JYmtW18juYkPJ5L27J0dmZvCWVqkAYSStvNb5VBsg6iWVF
	HWeJs+vxGNsILHePKf55RNGI0=
X-Received: by 2002:a05:6214:519a:b0:91e:a3a7:eabe with SMTP id
 6a1803df08f44-91eef7ed59dmr16998506d6.31.1794262811011; Mon, 09 Nov 2026
 14:20:11 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 14:20:09 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <yq5apkwettbg.fsf@kernel.org>
References: <20261104150322.3516320-1-aneesh.kumar@kernel.org>
 <20261104150322.3516320-7-aneesh.kumar@kernel.org> <20261104183754.10457-1-griffoul@gmail.com>
 <yq5apkwettbg.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 14:20:09 -0800
X-Gm-Features: AclHuK9yaZZX5RqlQUphUJAHyVgMZuWE0tyCGC8w_purOOnnuK3ITj8aYHc0AWs
Message-ID: <CAEvNRgFE5=u8Q+fCUxLT7M_gAjkgNddSVrM3axuTUxBScffcbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 06/25] KVM: guest_memfd: Support device-backed PFN providers
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Fred Griffoul <griffoul@gmail.com>, 
	linux-coco@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, David Woodhouse <dwmw2@infradead.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Fred Griffoul <griffoul@gmail.com> writes:
>
>> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>>
>>> Device resources such as PCI BARs supply PFNs directly and cannot use
>>> the folio allocation path. Store the mapping owner and device ID in the
>>> core context during attach(), and use them when preparing device
>>> memslots. Keep device memory separate from ordinary PFN-backed RAM.
>>
>> The device rules you wrote down in api.rst and locking.rst helped a
>> lot. If I read v4 right, the device backing differs from the RAM PFN
>> backing in these places:
>>
>>   1. PFN mode calls RAM arch hooks: kvm_arch_gmem_make_shared() at
>>      conversion, kvm_arch_gmem_make_private() at fault, and
>>      kvm_arch_gmem_reclaim() on revoke and release. The device path
>>      has to skip them.
>>
>
> I would say that the VFIO provider expects the conversion to complete at
> conversion time, rather than being triggered by a fault.

guest_memfd currently does .gmem_make_shared() eagerly and
.gmem_make_private() lazily (at fault time).

Technically conversion time spans everything from guest exit to request
a conversion, including the guest_memfd conversion ioctl, then till the
vCPU run completion hook.

Can we move the mapping out of the conversion ioctl and into some
dedicated CCA-specific mapping ioctl, kind of like KVM_ARM_RMI_POPULATE
but doesn't actually perform writes, just does mapping?

The mapping ioctl should check the necessary prereqs, same for the
vcpu_run completion hook.

Here are some advantages I can think of:

1. Decouples mapping of VFIO addresses from guest_memfd and provide more
   understandable errors for userspace, since the mapping step has a
   clear and separate error (conversion is complicated enough with many
   failure points)

2. Better aligned conversions in general where marking private at the
   platform level is lazily performed. In this case, doing it outside of
   the conversions ioctl is not much lazier, but slightly :)

   Not quite mapping, but Suzuki did bring up that for regular memory
   (not VFIO), ARM CCA requires vCPU context for SMC_RMI_RTT_SET_RIPAS
   in .gmem_make_private(), hence that's done in the vcpu_run completion
   hook, so that's kind of lazier, relative to doing
   SMC_RMI_RTT_SET_RIPAS in the conversion ioctl.


> This is also
> required because, when an MMIO validation request completes, the guest
> expects the range to be mapped. The current flow is that the MMIO
> validation request exits to the VMM, which uses set_memory_attributes()
> to convert the range to private.
>
>>   2. lookup_pfn_range() only feeds those hooks, so the device path
>>      does not need it.
>>   3. The host mmap and stage-2 need a device memory type.
>>
>
>
> Do you mean this code? vm_page_prot is used for the host mapping created
> by mmap() on the guest_memfd, and its setup follows
> vfio_pci_core_mmap(). I think the only device-specific difference here
> should be pgprot_noncached(). Shouldn't the rest of the protection
> remain unchanged even for device PFNs?
>
>
> +	if (gmem_provider_is_device(gi)) {
> +		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +		vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +		vma->vm_ops = &kvm_gmem_device_vm_ops;
> +		return 0;
> +	}
> +
>

What do you think of just forwarding .mmap to VFIO to figure out? This
makes VFIO less special of a provider, since I imagine different
providers may want to have different page protections or VMA flags.

guest_memfd just enforces VM_PFNMAP for PFN-mode providers.

Here's my forwarding setup: [1]. In my proposed control/data-plane
split, the vfio_fd undergoes VFIO_DEVICE_BIND_IOMMUFD with
VFIO_DEVICE_BIND_FLAG_CTRL_ONLY to become eligible for attaching to
guest_memfd. Data plane for vfio-pci == BAR supports mmap, so in this
setup, the vfio_fd's .mmap() would always fail, and the gmem fd's
.mmap() would just let VFIO set up whatever it needs.

[1] https://lore.kernel.org/all/20261106-gmem-alternative-providers-v3-61-8484dde66a7e@google.com/

Wrt the page protections, in my setup gmem reports the cacheability so
the KVM MMU can use that information to set up the stage 2 mappings.

The provider can now set up different cacheabilities for userspace page
tables vs stage 2 page tables if it wants to.

(At least that's what I intended, given my limited knowledge of ARM)

>
> [...snip...]
>

Let me catch up on the rest later :)
