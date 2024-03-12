Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B536111AC
	for <linux-coco@lists.linux.dev>; Tue, 12 Mar 2024 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222372; cv=none; b=B7yATQI9WQC+V+O37wzQ2HBYcPqwghjKAuEVZ2pWyvGVZGMDcQSrwZG5YqRKKTohk+hq3s/pi0/6VvSvIT1xLoTBAJ/BeNTTePumJSN1754+WErb+kK81tTEPTHJU+2irQrCzEiJbZAsCDqKGD25yYo/u4MsO8Qf5MxqX7WiBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222372; c=relaxed/simple;
	bh=p/qM/uvqJknlkhIz++zsgYm5UEdegHpPBL/SEz1rPBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa/IWSFmQSQ7dirRejf2PtRWpObCGe4jtk6iQw3BZpDtkvSVuhQ2Gxi+JognQf/88c3HeQ4ziveXy4Y+PVV5O5dEM6VR8Jj/N0qFym4Zdslh0LVZwRGc2Da4bZLEjjmJswqEzuHTdg69sVtX/IBNaEHm9CmeogILmN4jBj2u/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56847d9b002so3244347a12.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 22:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222368; x=1710827168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEgAABfrmv9f6da9s+EJl/QuGoeCFMl1ymUuyGPWf5k=;
        b=OLd1zVupxcafCduuU0eAUaza/YyAvehzo7f6Obj2jkEGyUvtzuf/7v53Av/CH66VBu
         9O0qWb3OUj4EuXSa1iJ5ed9ipRsLdOX5Wcftm+RAOGi1JGcRgX7rbdCEK3GHsGRQjW05
         RzIIOC0dZb50S7dGs0wol3hw0GSRcNDXrZv75K5wERg9sDIN3hPi1C5Y3h+jiNdV6boJ
         XDldumMEEk0IDqlhwxWWM9CaVCHd1pEPMNSQ0ekBcnorgbi18s0ORafK+O0jX/6KinEL
         Wx3S9+eRtKulK/rY5cXj30sauTDLQGNUPaYmknEpgE8ZFzh+wzkvPmFNzUXuTlPfBEpP
         7Lrg==
X-Forwarded-Encrypted: i=1; AJvYcCU3QPv8lSZuhg3BkMyB9BCYfxzcyTRFVRf1yCpSRnfKcP3hg4Hc41syApWfzRCWmyW8nbIFCOGcoyp/Cwc0jReASP8EdhQKnchOkg==
X-Gm-Message-State: AOJu0YxeF90gXOT+NWkOA7pF5qgLOE6reFoFWogsUuwQzXaAENrkcAN2
	50SzayWf1INpW/VX7fGhUACwYrdpOogzqAm9O344yVo7LRSRXS9eXjq9GKiiWidU6g==
X-Google-Smtp-Source: AGHT+IHfa/Mz+GeMHYif7cjzeSx0pZ9IDMbXpcTLj85fK6aN6c/vdJCVKefb4HXe45etH12Q/E8JXQ==
X-Received: by 2002:a17:906:d157:b0:a46:3ae6:a256 with SMTP id br23-20020a170906d15700b00a463ae6a256mr938561ejb.18.1710222367934;
        Mon, 11 Mar 2024 22:46:07 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id o23-20020a1709062e9700b00a44cf710cc3sm3473572eji.182.2024.03.11.22.46.06
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 22:46:07 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4429c556efso412446366b.0
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 22:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQhm0DiH6/VGhR7oUBMdpvthzOC2asoA18rIAdFLazJQEHXFnpKdBQpHQWpFG5oSpjXQBQXSDTJRkRgOeRie1ItBfG/rjxqHgo9Q==
X-Received: by 2002:a17:906:4a89:b0:a46:2b4d:e3f8 with SMTP id
 x9-20020a1709064a8900b00a462b4de3f8mr2377402eju.19.1710222366228; Mon, 11 Mar
 2024 22:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311161558.1310-1-mhklinux@outlook.com> <20240311161558.1310-3-mhklinux@outlook.com>
 <13581af9-e5f0-41ca-939f-33948b2133e7@linux.intel.com>
In-Reply-To: <13581af9-e5f0-41ca-939f-33948b2133e7@linux.intel.com>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Mon, 11 Mar 2024 22:45:54 -0700
X-Gmail-Original-Message-ID: <CAC41dw9RKh1EzprEHqy+BpRbPNYiwOLvnWeauErdMLDCJdRyLA@mail.gmail.com>
Message-ID: <CAC41dw9RKh1EzprEHqy+BpRbPNYiwOLvnWeauErdMLDCJdRyLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Drivers: hv: vmbus: Track decrypted status in vmbus_gpadl
To: mhklinux@outlook.com, rick.p.edgecombe@intel.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	gregkh@linuxfoundation.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, kirill.shutemov@linux.intel.com, 
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, 
	linux-coco@lists.linux.dev
Cc: elena.reshetova@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 10:02=E2=80=AFPM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 3/11/24 9:15 AM, mhkelley58@gmail.com wrote:
> > From: Rick Edgecombe <rick.p.edgecombe@intel.com>
> >
> > In CoCo VMs it is possible for the untrusted host to cause
> > set_memory_encrypted() or set_memory_decrypted() to fail such that an
> > error is returned and the resulting memory is shared. Callers need to
> > take care to handle these errors to avoid returning decrypted (shared)
> > memory to the page allocator, which could lead to functional or securit=
y
> > issues.
> >
> > In order to make sure callers of vmbus_establish_gpadl() and
> > vmbus_teardown_gpadl() don't return decrypted/shared pages to
> > allocators, add a field in struct vmbus_gpadl to keep track of the
> > decryption status of the buffers. This will allow the callers to
> > know if they should free or leak the pages.
> >
> > Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > ---
> >  drivers/hv/channel.c   | 25 +++++++++++++++++++++----
> >  include/linux/hyperv.h |  1 +
> >  2 files changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> > index 56f7e06c673e..bb5abdcda18f 100644
> > --- a/drivers/hv/channel.c
> > +++ b/drivers/hv/channel.c
> > @@ -472,9 +472,18 @@ static int __vmbus_establish_gpadl(struct vmbus_ch=
annel *channel,
> >               (atomic_inc_return(&vmbus_connection.next_gpadl_handle) -=
 1);
> >
> >       ret =3D create_gpadl_header(type, kbuffer, size, send_offset, &ms=
ginfo);
> > -     if (ret)
> > +     if (ret) {
> > +             gpadl->decrypted =3D false;
>
> Why not set it by default at the beginning of the function?
>
> >               return ret;
> > +     }
> >
> > +     /*
> > +      * Set the "decrypted" flag to true for the set_memory_decrypted(=
)
> > +      * success case. In the failure case, the encryption state of the
> > +      * memory is unknown. Leave "decrypted" as true to ensure the
> > +      * memory will be leaked instead of going back on the free list.
> > +      */
> > +     gpadl->decrypted =3D true;
> >       ret =3D set_memory_decrypted((unsigned long)kbuffer,
> >                                  PFN_UP(size));
> >       if (ret) {
> > @@ -563,9 +572,15 @@ static int __vmbus_establish_gpadl(struct vmbus_ch=
annel *channel,
> >
> >       kfree(msginfo);
> >
> > -     if (ret)
> > -             set_memory_encrypted((unsigned long)kbuffer,
> > -                                  PFN_UP(size));
> > +     if (ret) {
> > +             /*
> > +              * If set_memory_encrypted() fails, the decrypted flag is
> > +              * left as true so the memory is leaked instead of being
> > +              * put back on the free list.
> > +              */
> > +             if (!set_memory_encrypted((unsigned long)kbuffer, PFN_UP(=
size)))
> > +                     gpadl->decrypted =3D false;
> > +     }
> >
> >       return ret;
> >  }
> > @@ -886,6 +901,8 @@ int vmbus_teardown_gpadl(struct vmbus_channel *chan=
nel, struct vmbus_gpadl *gpad
> >       if (ret)
> >               pr_warn("Fail to set mem host visibility in GPADL teardow=
n %d.\n", ret);
>
> Will this be called only if vmbus_establish_gpad() is successful? If not,=
 you might want to skip
> set_memory_encrypted() call for decrypted =3D false case.
>
> >
> > +     gpadl->decrypted =3D ret;
> > +
>
> IMO, you can set it to false by default. Any way with non zero return, us=
er know about the
> decryption failure.

I understand this change after looking at the rest of the patches. So
please ignore the above
comment.

>
> >       return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
> > diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> > index 2b00faf98017..5bac136c268c 100644
> > --- a/include/linux/hyperv.h
> > +++ b/include/linux/hyperv.h
> > @@ -812,6 +812,7 @@ struct vmbus_gpadl {
> >       u32 gpadl_handle;
> >       u32 size;
> >       void *buffer;
> > +     bool decrypted;
> >  };
> >
> >  struct vmbus_channel {
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>
