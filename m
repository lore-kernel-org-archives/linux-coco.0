Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA938A732
	for <linux-coco@lists.linux.dev>; Fri, 27 Mar 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640621; cv=pass; b=uEeUszp8B5zx5XI/ieKxFwissU9oG6tJSNNbdNXucNODSrQ6gKYkcDGLZyJjbBTQA2nGOJIVDgb3gUNjjUWiZHbjyTUTsPHauRPPUSoj7YHTVebJqz6IndaZttYwyLeSBTWu+6A3NUWmZSv0+0RSmqdNz055fklalJMaKtNj9CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640621; c=relaxed/simple;
	bh=mAa0q11vT2K7+sL7S++M6Oz+Ma+owZM4tYL8Ai5PqnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUO7wwjzWpQEge83vWkkIrQeaM1ZvQWdbPWbL/5lSOvc2RMoiGFU5TFQx6/qBRwG46ZKE5oYmaT0N5rlbZvf1qzmZtCjikhkk0/M44ptt/0CKKMNWNTES4pXEiFMSjGw3oRF/6mR/730rSYO6CUFVzkZOvifa47koUYh5E/W+nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxF1CPGb; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxF1CPGb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48569636800so17415e9.0
        for <linux-coco@lists.linux.dev>; Fri, 27 Mar 2026 12:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774640613; cv=none;
        d=google.com; s=arc-20240605;
        b=ECIngC6a6TzsFsw88JBbxUcFQUwUocu8jCgybWH/svGD4om5NK3tvTYvOy47ucE/Ky
         YRg4Z9zLDkutKNH05T4+dbY1rFGln6mkGTaD7n0xPAsXK6YvLwx7DqEBxqQc1DNlxNE9
         pQWwqgeVf3TUYKdwZ1wIt+pcnQx2Ulh7q0qsXuLGyKW+CqBhY3PS/VtK//7Wdk33yADs
         gf6757E9JG0bRGM9Lh9uc2gufyj5XjQyDN/0TCZoBAsDvRYdRLbD3ElLw57Ed39dD6MH
         E6q0exMXzrUZ3ocZrgasjVDWxxtM+JTu2uG29k1yz3MzAzzqhQrzOBVrmXYrG1GVKE9r
         vxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        fh=Q09reO363z6sh7A1G8qlxFKbquiRkPP1cwczCA45rPU=;
        b=Zx3MqdGUupMyLDFWaFzVHLhfVF4IFABtIr3UjIhNuocWqzQpGwf+mERknz1h3sqdht
         b+UG95hKr/TVmQdLRwIf8vVdZ5XexlNkt4u2z6eSWDPQVjMlMxm10eLE+LoefDqafwQH
         TdxvFdu45zqG8cOqh2waWy0VyJl8OrBEUDf+Vk+NXADYvATU9aUtcF/wzrg/IqCKzf25
         PlgiGjvTO38DSACY9JP+4O8+z/kA/ykoyAMBM89Ti6aMoO9hiehChatogWUIYS3yKcjI
         PuCxU868Nr6eJBSbcnyE5tqjVyBFf6jRyu5B5kkNW86WUBPKduqLpFBrY0h4kWZNMyVa
         AzJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774640613; x=1775245413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        b=rxF1CPGbcU11kRXQB5N9DS8JQvNNeZXWml+bE+LR2NrLR29DGARZ7d42+VdKQL55Ox
         gL+w5l7A5IaoRRD89Z/XHLq2QYqUu4M8JjPpxcEYroV22+y1N5VrRa7MJjKIAaJ8As46
         orJf5E8qyvIagpywo2sqtXwVmZcfeRZLXGI5chP8wlcW+T+NkW9uBltTdBy70yDfOsmK
         DplUgMmUEXCe1qA8KDxw7G44WSIZSZxiEGjIy9Naooj6RtUFSHrr5EEVzygBVNA3M3uS
         AikiDYvxWKFbn5WDDBzTZZAQ5boBlmlAnJCpyzMsQMeNZU1qGHLSbZE/lpUjvSHwCg1v
         RKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640613; x=1775245413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tjhOfzQT3ZRSG3eV9w6+z7kzXwwNkzHiubxpA2Yl+8=;
        b=G/pdlDbj7yMXNiKjMQ0mPDUnd+bWE3nXSm69XEPYVerJvZcAxFR2T2vkY+JXTAzCAI
         AINryL17LgBRbqo8bL/xiikjdy6DRyGIoJZFVzT2A5dCeQCxo11stxlR504kVM1N5fA5
         m3MBtqw+7IqAt7XdoQw9llrBQuVZMXxedNoTVn9gvaJkTXub0yKORoYxfNQQGoQj3g3H
         4cGmorvQFHa8zQENNs4RhJQ3LrGvnDuSCowdxKr1h6u2BuXbaMh8Y85qOKRNYcXQH60W
         WykYAJkuZDOinfnYa63OkBg8e0iIqRTB3hwqTNU9z7glYDgBYTKscSOHRIsgFnmjkPwx
         Lnag==
X-Forwarded-Encrypted: i=1; AJvYcCUnTWF8xDCCqqxEJsSsFIj/T9s95Wy6nswTBw8EkIMKeKkQ3oaPQO3qOaP8IMvy+VprBklzBUKWYbX+@lists.linux.dev
X-Gm-Message-State: AOJu0YzYMLNcGvc9RmXko0Jf9pY34jy+//n1D7VUFn/qe8P9CXpbJGpE
	mdCpPLfi+2uuBSp9gwj+VPJsmbk618BaaiXjFmBdjeFxVdSqL9/YlOF2DqKUuE8bMDw5lMK2+SA
	g+3bg18P0kdJ/nS6N80IreKW6xUTmgF9r8hqpzaK6
X-Gm-Gg: ATEYQzyMHUDqFzO+kwNMcGZm00WY8UwyvP5kcp6Ci+NTgNju78eQNnk0QwRzagnxRdR
	Y3iQl3mJWtdMfcYB8Bzgw4eeaHGPDwa6sUjg1SGTDjfk9DjGITn20HOECE8tzXB0RLZp2VDEt3A
	Tmn/W4JQaPGLU4s/4NpLBqq/axXP5xL7HledaixqIjM6857VQpRdIW9THe43WKu9Vnixj9AqXeo
	2eDAbFwLyWhGKVlzVXX9ECwNvTPMOkn5GAwARNSOaFKtUKAN/OSIWfsAe2xgt4YZjtoutekMZ5Q
	Mh6ghHDP3vwC1gcGC8b0++t0E0cufGcHCP28HSTJgIb2mg0iYwUMUQcqE71osMMmfLWE
X-Received: by 2002:a05:600c:898:b0:483:6a76:11a6 with SMTP id
 5b1f17b1804b1-4872fb4af58mr49025e9.5.1774640612616; Fri, 27 Mar 2026 12:43:32
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325192352.437608-1-jiri@resnulli.us> <20260325192352.437608-3-jiri@resnulli.us>
In-Reply-To: <20260325192352.437608-3-jiri@resnulli.us>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 27 Mar 2026 12:43:20 -0700
X-Gm-Features: AQROBzBYesqFRGc3W9I0GrvLQe43hwnK276StdxFy-fmLYpUjceKHOTqIZ5lfxQ
Message-ID: <CABdmKX2G-RavjPxmeTH4iiawNqN8ronj5dytYxKTYRJvtDXoFg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:23=E2=80=AFPM Jiri Pirko <jiri@resnulli.us> wrot=
e:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_shared" dma-buf heap to allow userspace to
> allocate shared (decrypted) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is private by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is private or
> shared. The kernel's direct map is set up as private,
> so pages returned by alloc_pages() are private in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to private memory (no TDISP support), it has to be explicitly
> shared. A couple of things are needed to properly handle
> shared memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent shared memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the shared pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>
> - DMA_ATTR_CC_SHARED for DMA mapping:
>   Since the pages are already shared, the DMA API needs to be
>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>   as unencrypted for device access.
>
> On non-CoCo VMs, the system_cc_shared heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly shared memory.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
