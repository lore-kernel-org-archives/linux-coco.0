Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF2246779
	for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454468; cv=none; b=JSL4TTh6zVU7QRCnAaMiFswwAlQWSbVybH2N8NYO/L0uSZwcuHHYCNvJHjeJYwQ1nq7C7CIUIPmGDO3lHYelfEctysLkUjuZL9/yl5fg909orAO2CjK2k+Oly6iZf8/NXS9CBgaePEnO2cRxwMm/ZlFdTJfEIhlQfEbQ/XYbYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454468; c=relaxed/simple;
	bh=sGTl1eo91jSnILZM8TuIOEpIUOHHIl79Ky9Pwbzq9nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTQX83f5WFBIkBAst7/lwm7q7PQaQwspKHNy9kbbOXtvVlLT4etHf9gSaa2D6b0ZjdVQqHD3gK3j+0awkjOfPEIxo8jdHmwf+PXnBshY4nXASbCn/M92dslrFQacjX6D5njXdvg0/IHqdCEG7s5lJZMI2af2i4Uxt0+CG9jcp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPxXdgwL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPxXdgwL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23dc5bcf49eso29140175ad.2
        for <linux-coco@lists.linux.dev>; Fri, 25 Jul 2025 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753454465; x=1754059265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKgsPP4zPK7SJVV2IQKnHzdNSGAtC3gfZtrlCNS6aF4=;
        b=JPxXdgwLGG1dDfAgVa34Ojt5pseguTl0AzjX/Z5EXxd9apgPaC5Nvpis7OyV2PYxjA
         lj7eLUHWYGvOlWCV/ImQ8rzz9Dj2KVHIHRPmXspeDevwLOAb7yDeq+384Rz+hHAczUif
         KKgIkC9STKKlcJm8aX3yLZM5kuHpboxDY6/ki/mzWnNHW5urpOwvdZZHMh8mQjaOH2io
         yxdUg5J/pvgJc2Jk4ilEurbxJ3al4XvKie1tn81WDhidKLPPCBW24erFdVfUT33Cp9w8
         +G6eEEPWm4p2PkOTbG6VaLMAco/QszP43QZKlif7X86p4ygOI9pfCq4IR9DVdazS//4y
         dmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454465; x=1754059265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKgsPP4zPK7SJVV2IQKnHzdNSGAtC3gfZtrlCNS6aF4=;
        b=oIDlse42wHoD0Dj3XgbnJSqW/MHybp1IbVJJGHkyMDdTmBFOYQ8CmjYLF8k/BR4P6H
         kQMhBxpG9ZPJ+iY6O7CGFsUXSLLK/3hJSOZFh1yDeb3aa1o1TxQCOVaMZrrTzJxqSiyD
         ja6ZSudl6u9ROtW4aTu6rIE5w08hMyVWlWrpJWUmAmVueoz/Pms+7HORl4StOBcVVc7r
         lrJvMYl7yDILJEboTIYHFV9kp09hK8D5lYBHUxtIwPYHbx/cwIuxhXGuwsnyW59KmqPa
         zPOfStRoCjPGYW4JEzgjIba4P8Xr6ssZ0b3bXalffFMzwIqTC92cj45aNQ290aI62lyV
         QQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVLuD7xhsfGVMi+vgeWrvy/nsaL1y2eLZtRjUxBsJGVpLeQSSGk2EC1LwuBxxNMjpgs8+6Hx4nB4Ji4@lists.linux.dev
X-Gm-Message-State: AOJu0YxBviP9MKdTMRsuV7MtKw64tCh8N9GxgBUmlfI73Aw/bmx3+d3J
	SZKzCEUANWP/Jw6ePCYNEcPr75+DZKs70Ry+tR8/dSAUVlz+u+VQyNt48JlUlSfLZkRAZbQgX3O
	+gC/NzGXg1fIKmCcK9YGtNwhSvEujTmU=
X-Gm-Gg: ASbGnct5SnOBXG5o2rEOE5qUkcafAkwAmiOjVHIsAbvTIQkKyRWEdMJKJprAvgg2JiW
	jyGrNppNBXHyLeaZ8Dd+UT3qoR78spANTlv4DsU5wNUsqzorgPYHpgAlMrp+Dz6L3D1c3ttS+vV
	c4INzQy+G+qSsNEF2wDdDuJ4d0KXvlcGCubuiz5ZXpKXysKUkrpGof44dwk4XHYgPrU+VAdz9tS
	8leLs2bAyslTvo=
X-Google-Smtp-Source: AGHT+IFePPdNf5mTv+w/Kxg+8bWSXr5Vh2E5/lMd3Me7vurN8JkxVvIEE7J6nQMlYnnWtLKMSDKRAdRJQJFR2RNXDDE=
X-Received: by 2002:a17:902:c751:b0:234:ed31:fc99 with SMTP id
 d9443c01a7336-23fb309b836mr26836565ad.21.1753454465068; Fri, 25 Jul 2025
 07:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714221545.5615-1-romank@linux.microsoft.com> <20250714221545.5615-13-romank@linux.microsoft.com>
In-Reply-To: <20250714221545.5615-13-romank@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 25 Jul 2025 22:40:29 +0800
X-Gm-Features: Ac12FXxEB_FL3_rT6cHSVkdJsOhCBETxNq543NIYn_bXKIfHCNGG5wd0r0RZbmw
Message-ID: <CAMvTesBiSOsxywS+JxAB+oAh9i1UEbngAXeZJdi7SWqm9pAd9A@mail.gmail.com>
Subject: Re: [PATCH hyperv-next v4 12/16] Drivers: hv: Allocate encrypted
 buffers when requested
To: Roman Kisel <romank@linux.microsoft.com>
Cc: alok.a.tiwari@oracle.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, 
	hpa@zytor.com, kys@microsoft.com, mhklinux@outlook.com, mingo@redhat.com, 
	rdunlap@infradead.org, tglx@linutronix.de, Tianyu.Lan@microsoft.com, 
	wei.liu@kernel.org, linux-arch@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, apais@microsoft.com, 
	benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:28=E2=80=AFAM Roman Kisel <romank@linux.microsoft=
.com> wrote:
>
> Confidential VMBus is built around using buffers not shared with
> the host.
>
> Support allocating encrypted buffers when requested.
>
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

>  drivers/hv/channel.c      | 49 +++++++++++++++++++++++----------------
>  drivers/hv/hyperv_vmbus.h |  3 ++-
>  drivers/hv/ring_buffer.c  |  5 ++--
>  3 files changed, 34 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> index 35f26fa1ffe7..051eeba800f2 100644
> --- a/drivers/hv/channel.c
> +++ b/drivers/hv/channel.c
> @@ -443,20 +443,23 @@ static int __vmbus_establish_gpadl(struct vmbus_cha=
nnel *channel,
>                 return ret;
>         }
>
> -       /*
> -        * Set the "decrypted" flag to true for the set_memory_decrypted(=
)
> -        * success case. In the failure case, the encryption state of the
> -        * memory is unknown. Leave "decrypted" as true to ensure the
> -        * memory will be leaked instead of going back on the free list.
> -        */
> -       gpadl->decrypted =3D true;
> -       ret =3D set_memory_decrypted((unsigned long)kbuffer,
> -                                  PFN_UP(size));
> -       if (ret) {
> -               dev_warn(&channel->device_obj->device,
> -                        "Failed to set host visibility for new GPADL %d.=
\n",
> -                        ret);
> -               return ret;
> +       gpadl->decrypted =3D !((channel->co_external_memory && type =3D=
=3D HV_GPADL_BUFFER) ||
> +               (channel->co_ring_buffer && type =3D=3D HV_GPADL_RING));
> +       if (gpadl->decrypted) {
> +               /*
> +                * The "decrypted" flag being true assumes that set_memor=
y_decrypted() succeeds.
> +                * But if it fails, the encryption state of the memory is=
 unknown. In that case,
> +                * leave "decrypted" as true to ensure the memory is leak=
ed instead of going back
> +                * on the free list.
> +                */
> +               ret =3D set_memory_decrypted((unsigned long)kbuffer,
> +                                       PFN_UP(size));
> +               if (ret) {
> +                       dev_warn(&channel->device_obj->device,
> +                               "Failed to set host visibility for new GP=
ADL %d.\n",
> +                               ret);
> +                       return ret;
> +               }
>         }
>
>         init_completion(&msginfo->waitevent);
> @@ -544,8 +547,10 @@ static int __vmbus_establish_gpadl(struct vmbus_chan=
nel *channel,
>                  * left as true so the memory is leaked instead of being
>                  * put back on the free list.
>                  */
> -               if (!set_memory_encrypted((unsigned long)kbuffer, PFN_UP(=
size)))
> -                       gpadl->decrypted =3D false;
> +               if (gpadl->decrypted) {
> +                       if (!set_memory_encrypted((unsigned long)kbuffer,=
 PFN_UP(size)))
> +                               gpadl->decrypted =3D false;
> +               }
>         }
>
>         return ret;
> @@ -676,12 +681,13 @@ static int __vmbus_open(struct vmbus_channel *newch=
annel,
>                 goto error_clean_ring;
>
>         err =3D hv_ringbuffer_init(&newchannel->outbound,
> -                                page, send_pages, 0);
> +                                page, send_pages, 0, newchannel->co_ring=
_buffer);
>         if (err)
>                 goto error_free_gpadl;
>
>         err =3D hv_ringbuffer_init(&newchannel->inbound, &page[send_pages=
],
> -                                recv_pages, newchannel->max_pkt_size);
> +                                recv_pages, newchannel->max_pkt_size,
> +                                newchannel->co_ring_buffer);
>         if (err)
>                 goto error_free_gpadl;
>
> @@ -862,8 +868,11 @@ int vmbus_teardown_gpadl(struct vmbus_channel *chann=
el, struct vmbus_gpadl *gpad
>
>         kfree(info);
>
> -       ret =3D set_memory_encrypted((unsigned long)gpadl->buffer,
> -                                  PFN_UP(gpadl->size));
> +       if (gpadl->decrypted)
> +               ret =3D set_memory_encrypted((unsigned long)gpadl->buffer=
,
> +                                       PFN_UP(gpadl->size));
> +       else
> +               ret =3D 0;
>         if (ret)
>                 pr_warn("Fail to set mem host visibility in GPADL teardow=
n %d.\n", ret);
>
> diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
> index 2873703d08a9..beae68a70939 100644
> --- a/drivers/hv/hyperv_vmbus.h
> +++ b/drivers/hv/hyperv_vmbus.h
> @@ -200,7 +200,8 @@ extern int hv_synic_cleanup(unsigned int cpu);
>  void hv_ringbuffer_pre_init(struct vmbus_channel *channel);
>
>  int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
> -                      struct page *pages, u32 pagecnt, u32 max_pkt_size)=
;
> +                      struct page *pages, u32 pagecnt, u32 max_pkt_size,
> +                          bool confidential);
>
>  void hv_ringbuffer_cleanup(struct hv_ring_buffer_info *ring_info);
>
> diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
> index 3c9b02471760..05c2cd42fc75 100644
> --- a/drivers/hv/ring_buffer.c
> +++ b/drivers/hv/ring_buffer.c
> @@ -183,7 +183,8 @@ void hv_ringbuffer_pre_init(struct vmbus_channel *cha=
nnel)
>
>  /* Initialize the ring buffer. */
>  int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
> -                      struct page *pages, u32 page_cnt, u32 max_pkt_size=
)
> +                      struct page *pages, u32 page_cnt, u32 max_pkt_size=
,
> +                          bool confidential)
>  {
>         struct page **pages_wraparound;
>         int i;
> @@ -207,7 +208,7 @@ int hv_ringbuffer_init(struct hv_ring_buffer_info *ri=
ng_info,
>
>         ring_info->ring_buffer =3D (struct hv_ring_buffer *)
>                 vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP,
> -                       pgprot_decrypted(PAGE_KERNEL));
> +                       confidential ? PAGE_KERNEL : pgprot_decrypted(PAG=
E_KERNEL));
>
>         kfree(pages_wraparound);
>         if (!ring_info->ring_buffer)
> --
> 2.43.0
>
>


--=20
Thanks
Tianyu Lan
