Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4A366DB0
	for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871604; cv=pass; b=fh/ZoELltEklejBzrksyFdezPdGgrkcvl2z/JlXFAd4KnkGjkWxC32hx6ce5COirKVRiWoxIabV9pefacewCSGLhIg50xO+3tsI8Q6HGny0wjUXw39SsaDYfbF6S3Ilhtj1zLyFvMluMh2gtoQrKUjDPvTuyA8Vio+OReGxsuN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871604; c=relaxed/simple;
	bh=OlksQpzsFEkRVJRE9g419OdwGDh3+i8ICDHTevP//cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI3UTxYXDMDodZMMm6P4FY6m5aDyzluIuglyWN+66cK+vffSM/lGW/FzRpwIal2H+h7jy3YIkAzOwxPem58ezEPPT2My6BLtiXXUQKiemQ+kmnKrFjcswYJ4i6Dfvx+eldMRzkVKxr+sSPCEy5RrS6mAlLbztmN20BDx7HrSyV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hQDRt/B+; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hQDRt/B+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65bfe9c585cso7552900a12.0
        for <linux-coco@lists.linux.dev>; Mon, 23 Feb 2026 10:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771871600; cv=none;
        d=google.com; s=arc-20240605;
        b=NR8MbEECZcLiHc93So2qHCM2TbJaSMvkmY0gjffZrn3BKLnaxvqrhQIikcpBnKvq+M
         k+94o2zFt5X6F3GuYvIkCpwbOGab4B37A9YbBtHPtKSjy0J1rkUCJjrOZWjPZUvvl/bZ
         yxIJtZaq4bWNSkj0BQlxFuVHSIDJSi2oS/wUxYcLmdT16UPNoAsSnNVQbmOhgEnzrdRO
         l1VlgUfM1v24ivF2UqJJPfBe+JBGjgN0Pcef6C4eOaT9uthaRDUpmDDPDfCdfqQFiwKf
         meJ3IpVBKbyYiMWq2HnWkj+QpTWE+jcFdxcKT+Rmzpq8msSmLgWVLGhLsit7HiXo2iGo
         /DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        fh=jdfM2/4HAShs1doNk17W6ZlNu/labiyYPJ14DWTnBF0=;
        b=fwJnAVL8TUCmeNBkLcdPLrewZytiDFYCdTmrpUXuc4RjphdGudD+lm71M7bYM4C8FP
         PIc4b11gdwB3llUZTlWEAtKIjveiYD7H1x9bRmqnh5BJ7axUY7XvdhtgxgFxT1KAcuTQ
         WLUpD9SljyPeQFWVuSUhbK2RhmGIgMKlbJ+X3yxs4p6U5zdNrjV4DF9oCvQ7xSIHC/Mz
         lBqUNFEepHYbpRPTmnCoTjaL21Ia5AmSjmMfCclLFadQAgobiRP4fRP1dtLb88LOoJoR
         G5Fph93lt6X2IFrcnI5oZqdA+KM+FT3r2MY5zrIBoWnh9DN4rccnR4nEJZZhJfwyH96G
         aM6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771871600; x=1772476400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        b=hQDRt/B+dQ31ny/sIXT4S89GG+PrcXT0rXeb/DH7a0Y2CC5qTDac0aNAQ6bGnClceU
         lSZM0PV0OdjzFLCPvNgppeAAUc6oWB7EmQPNFe0IHYFDeVkemS1DMOZN2KU2FdrGXRi0
         e1JCpopEVRqt2c1EWHFAUPtH86V4ketNuA+8zA5KA6ZprgGTyTq+HOOvW443ZsINuDV6
         8ctwFk4J7CTQs4g6Kb2Iqf2rA7essZpbYiDVoRLIdLWN65b2XnkEnYfJQOopVNiTiXWh
         3iuDDijmh9iTnAfFGyCrdEpTWGmYaMPOmv+yScfBGACiOQeAUMQWDDJh8BynppOxS2JY
         vANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771871600; x=1772476400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
        b=TJXzkudF85alYSI9DJAj5RxNSAJlQQxOOYD+ie0O3TsSjpL1TeiaUWGCwpWERhhgJa
         rBWkBBASw7wo4dx10SpTzh0ieuqAmlWsOxMp3Nk885B0J7WYebpQn3jrKZvTpTIYvp9b
         mjIB3ntqMcKgA6LTQc0azavLt5Yatq4TJfzSXENa9Ld6qVoDMRJXEg80XKujsOx8ayCr
         od8cxqvM0PtpXoZLEeqpFEmagmLR1Nhv43js4B4kZgTh7vMcD8AGTv0fxMI3iODTExuC
         fAzOkGdksYaznYs4UCPO67jSObOObA4mF/KiVZfhy2IYt0vGuEh5jgG8a4bdjH+EcDKZ
         keIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOczU7uRjatXaeCyEyoWIEFg8odN6Rvfcvk2T0P+geITvf7zdHcQpYCR/rE8DNLhJGrUF9avu36Ugx@lists.linux.dev
X-Gm-Message-State: AOJu0YyrXigazXc5dAP5yxQ6s4la1Te31PouwTbyJ2AyzPFS+CZN9sX0
	MDMYdLA4p3BUHjhSoLbidhamjw1hpDprLulNPvh6AQ6BwMf+z3hE8ZC2iYIjwCz9/djjkcgg5vQ
	qH/uDk+XoeIsNHBObdGslrqhJLF0U7dq4gfVXQ0o=
X-Gm-Gg: AZuq6aJBfpMOyFSNQ1ltQB1gMsJVRs57mRxOMlx8BIK1MPHG8UWOLhqgpIKDAoYgoD9
	MWWkdcoIzLlHK8QDiK8Q5MlDZuQ4rY66/PAd3rpdcKBgnUoTKRGi0jTbtx2pqVi4z5kGsC6iAkP
	Cgx2cn6gHQfWYszyQDdPTj0yYwf8bOY5ZiUYEenf5TihYbuYpHH989EUtkx6TDUjXxQywHjOvJZ
	f8C1E+5FkrVG/Oof4spZEVq+Wv+sBOX+OeT6/D1nlCPaxfyW7lAxuyB+Z9aRmozeeAK1IaOtQsy
	G/4MXIQoKyGxxyWkxYgamiCWEBiXFaQv9nFK
X-Received: by 2002:a17:907:9452:b0:b88:713e:78a5 with SMTP id
 a640c23a62f3a-b9081aeedf7mr579641266b.28.1771871599312; Mon, 23 Feb 2026
 10:33:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223095136.225277-1-jiri@resnulli.us> <20260223095136.225277-3-jiri@resnulli.us>
In-Reply-To: <20260223095136.225277-3-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Feb 2026 10:33:07 -0800
X-Gm-Features: AaiRm51mY0mKY0_1_wq03WmYtA7Qg-aNpUveVzAZTLNHpqLqVMbVU7X_E2imwkI
Message-ID: <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 1:51=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> allocate decrypted (shared) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is encrypted or
> decrypted. The kernel's direct map is set up with encryption enabled,
> so pages returned by alloc_pages() are encrypted in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to encrypted memory (no TDISP support), it has to be explicitly
> decrypted. A couple of things are needed to properly handle
> decrypted memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent decrypted memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the decrypted pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>
> - DMA_ATTR_CC_DECRYPTED for DMA mapping:
>   Since the pages are already decrypted, the DMA API needs to be
>   informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
>   as unencrypted for device access.
>
> On non-CoCo VMs, the system_cc_decrypted heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly decrypted memory.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Thanks for reworking this! I've not reviewed it super closely, but I
believe it resolves my objection on your first version.

Few nits/questions below.

> @@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_b=
uf *dmabuf)
>         for_each_sgtable_sg(table, sg, i) {
>                 struct page *page =3D sg_page(sg);
>
> +               /*
> +                * Intentionally leak pages that cannot be re-encrypted
> +                * to prevent decrypted memory from being reused.
> +                */
> +               if (buffer->decrypted &&
> +                   system_heap_set_page_encrypted(page))
> +                       continue;
> +

What are the conditions where this would fail? How much of an edge
case is this? I fret this opens a DoS vector if one is able to
allocate from this heap and then stress the system when doing the
free.

Should there be some global list of leaked decrypted pages such that
the mm subsystem could try again later to recover these?

> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 648328a64b27..d97b668413c1 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -10,6 +10,7 @@
>  #define _DMA_HEAPS_H
>
>  #include <linux/types.h>
> +#include <uapi/linux/dma-heap.h>
>
>  struct dma_heap;
>
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.=
h
> index a4cf716a49fa..ab95bb355ed5 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -18,8 +18,7 @@
>  /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>
> -/* Currently no heap flags */
> -#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
> +#define DMA_HEAP_VALID_HEAP_FLAGS (0)
>
>  /**
>   * struct dma_heap_allocation_data - metadata passed from userspace for

Are these header changes still necessary?

thanks
-john
