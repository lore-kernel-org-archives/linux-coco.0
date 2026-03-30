Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE763C3C00
	for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873055; cv=none; b=aDmSgRchzFr0l0Sq31XYUNtT70J+W+U7hkdHQDOPeTVLP6YvYJuh1svsNafWoLTRQGorgxrF8dzPpCacc+VpLWMn1HpuJX9leVHaNeGaghlWo+yO2u/AMCe/oyg+nEq8iEOG2AzvKVNcpE5wrkEJRnSwOx1HmHdtoYtTpvLNgEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873055; c=relaxed/simple;
	bh=ckJFhNb7kzwvdnqqS1RjoBTIurchpN0UBLUGxzqwVKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kA4WxGgBd5x9BptBApPT81T38LFIB7COeiZnDESK/B6fb3c7c+xP825bitM7WSFgaa4CLNvivTklkyE1NFuHZBJupnJtLKTXS96hE/ToTHcA/c00eiVJSo9aeA5lf3UyTfrc7TWF2s4GtHBE5FbNdYi63Pq9xlmDqU3YkniAQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQINSiTJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQINSiTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774873053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3czNvgtQJ29XTaQ6e0CJrK6m6/6KHxyqrNxsiklN7mI=;
	b=QQINSiTJ92OA3NIwXvrafCym6dRPxVrjx8WnrzD9lNkJn3GW2AUpWmbviPuhbj1KGiF083
	e2u+Tx4aCuwWNx0Ru47ip/Ydt0mMHv3zSXb7wZWGAghQMuLg1epi4wuVlTjK1k2+HQ735W
	MfsK3TUEVI+/gw5dnbqaIKBUHw8aMNU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-D2mZO9YROa6NgtU4euRLtA-1; Mon, 30 Mar 2026 08:17:32 -0400
X-MC-Unique: D2mZO9YROa6NgtU4euRLtA-1
X-Mimecast-MFC-AGG-ID: D2mZO9YROa6NgtU4euRLtA_1774873051
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so15338320a91.1
        for <linux-coco@lists.linux.dev>; Mon, 30 Mar 2026 05:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873051; x=1775477851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3czNvgtQJ29XTaQ6e0CJrK6m6/6KHxyqrNxsiklN7mI=;
        b=XIBNAGVnXqlbOX+btw7kA30Wb24fDqAcUU5oXgo6vZI3Frp/cpAh7CGIaNpIKOIFPw
         q3lep+7ddjfkfFP5/7tRSEjtT14HdinXhP0yk4owCw6lyOnYSQVa3eGqu9Iv1nR0X4Bj
         U4lnAv1Vx8O5IC8aKNLmuUNGeicc6LXzavk2VdlzDGNs6Rh8ZSyoPV1LWwzs1SD+qaQn
         iSVQgMH+SkVURHnIt/d8ZAXWZ3Ms0onEauAJ8gLSaiuTcgP84+yidWUIQVRorGW9E4tZ
         flirxYe6A3qLb3VgEopS+jbwtJPUBYqYk8c5gCA6U41StFJN8FakMpQb54sIin1konOB
         Lbbg==
X-Forwarded-Encrypted: i=1; AJvYcCW0V9ljH3kKV8Gq7Xc/0RAz2QB+ZANkRw5WO3/rOgtD+UXUrwkVZSbl0m2jVvWz0ucWMRQ3Ad/7thfv@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7FkhxwDOLpvog9barnY7TsJDOkBt8DXa4mHhOp+hmycILYID/
	3wqxFVJX7acv/CWyt3wgn7dNXEq745JjCDpgUqO0QuPUiZ5RadWXONC9WygK9HmPQz+6kJMMWSP
	lRokenrRZKou9ppJjFGU+5h5VIEFGUPZjkDW0rW9Gtsyf21pI+QfaDpu8001KnUXS6gWwwPmrxn
	mBfEtv5uhdofOYjzexp/ZqHqTLaByCr0SvGoVecg==
X-Gm-Gg: ATEYQzyI3NGTz28eDiSI055hdvwwxwq31u6lhysuCE3+27jQ7Jv363y9bAUK65XjQwk
	9Zw4KW7KIzjT9qDV8eJTdKHiT8D2uGS0836E2P+ZxFwbnMA+WkEnegvQUng9zYol/eazT+0yLz1
	8KU8/lN6a2uSAiusBcsPqKzdDKyASKVcvh7mDSshy7hCHtPra3fLUeRlLXVWvuqbg1ptZt8mUKZ
	AIL+hUBw6OfklUuoobJIHKP43ml1el3K6SpLhAgO+C67P1QfoL1F9wLZsFAE7j7Jc/v1LgjomWX
	XJOg4Nc62qxyZKgVRBfEdZ8=
X-Received: by 2002:a17:90b:1e4f:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-35c3000dbc0mr11187025a91.12.1774873050899;
        Mon, 30 Mar 2026 05:17:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e4f:b0:35b:e593:b1d7 with SMTP id
 98e67ed59e1d1-35c3000dbc0mr11186982a91.12.1774873050418; Mon, 30 Mar 2026
 05:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324-tdx-hotplug-fixes-v1-0-8f29f2c17278@redhat.com>
 <20260324-tdx-hotplug-fixes-v1-2-8f29f2c17278@redhat.com> <acY/rr7g+gJmkXfg@yzhao56-desk.sh.intel.com>
In-Reply-To: <acY/rr7g+gJmkXfg@yzhao56-desk.sh.intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 30 Mar 2026 16:17:18 +0400
X-Gm-Features: AQROBzCFzI_YLOmrGuKXWfMmV1P1xMrwTYyuuKfPwXwr99gqlL-4GhNiZZ8v_pY
Message-ID: <CAMxuvaxtNz_Kpxv4akgGEY0PiY+dAg10nAJU57RP-pSEVHVgDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/tdx: Accept hotplugged memory before online
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xWHje5Ex6bEW4kOHF3SWBBMfWBqh68UyumyrrKoGyPk_1774873051
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 27, 2026 at 1:09=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Tue, Mar 24, 2026 at 07:21:48PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > In TDX guests, hotplugged memory (e.g., via virtio-mem) is never
> > accepted before use. The first access triggers a fatal "SEPT entry in
> > PENDING state" EPT violation and KVM terminates the guest.
> >
> > Fix this by registering a MEM_GOING_ONLINE memory hotplug notifier that
> > calls tdx_accept_memory() for the range being onlined.
> >
> > The notifier returns NOTIFY_BAD on acceptance failure, preventing the
> > memory from going online.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Reported-by: Chenyi Qiang <chenyi.qiang@intel.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  arch/x86/coco/tdx/tdx.c | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > index 7b2833705d475..89f90bc303258 100644
> > --- a/arch/x86/coco/tdx/tdx.c
> > +++ b/arch/x86/coco/tdx/tdx.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/export.h>
> >  #include <linux/io.h>
> >  #include <linux/kexec.h>
> > +#include <linux/memory.h>
> >  #include <asm/coco.h>
> >  #include <asm/tdx.h>
> >  #include <asm/vmx.h>
> > @@ -1194,3 +1195,40 @@ void __init tdx_early_init(void)
> >
> >       tdx_announce();
> >  }
> > +
> > +#ifdef CONFIG_MEMORY_HOTPLUG
> > +static int tdx_guest_memory_notifier(struct notifier_block *nb,
> > +                                  unsigned long action, void *v)
> > +{
> > +     struct memory_notify *mn =3D v;
> > +     phys_addr_t start, end;
> > +
> > +     if (action !=3D MEM_GOING_ONLINE)
> > +             return NOTIFY_OK;
> > +
> > +     start =3D PFN_PHYS(mn->start_pfn);
> > +     end =3D start + PFN_PHYS(mn->nr_pages);
> > +
> > +     if (!tdx_accept_memory(start, end)) {
> > +             pr_err("Failed to accept memory [0x%llx, 0x%llx)\n",
> > +                    (unsigned long long)start,
> > +                    (unsigned long long)end);
> > +             return NOTIFY_BAD;
> > +     }
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +static struct notifier_block tdx_guest_memory_nb =3D {
> > +     .notifier_call =3D tdx_guest_memory_notifier,
> > +};
> > +
> > +static int __init tdx_guest_memory_init(void)
> > +{
> > +     if (!cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
> > +             return 0;
> > +
> > +     return register_memory_notifier(&tdx_guest_memory_nb);
> > +}
> If I read the code correctly,
>
> online_pages
>   1. memory_notify(MEM_GOING_ONLINE, &mem_arg);
>   2. online_pages_range(pfn, nr_pages);
>        (*online_page_callback)(page, order);
>           generic_online_page
>               __free_pages_core(page, order, MEMINIT_HOTPLUG);
>
> In __free_pages_core(), there's accept_memory() already:
>
>     if (page_contains_unaccepted(page, order)) {
>           if (order =3D=3D MAX_PAGE_ORDER && __free_unaccepted(page))
>                return;
>
>          accept_memory(page_to_phys(page), PAGE_SIZE << order);
>     }
>
> __free_unaccepted() also adds the pages to the unaccepted_pages list, so
> cond_accept_memory() will accept the memory later:
>
> So, is it because the virtio mem sets online_page_callback to
> virtio_mem_online_page_cb, which doesn't invoke __free_pages_core() prope=
rly?
>
> Or am I missing something that makes the memory notifier approach necessa=
ry?

virtio-mem doesn't modify efi_unaccepted_memory bitmap (populated by
TDVF code when the VM is started)

