Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7C134A3
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694107517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/OggNw1/miPktGc+ci31BRP+FmUzQnb0YqvkymMCSY=;
	b=IflUP8Oarx/7MspHypGke+YRa/KKLQpID4aN0QPBjVvcGi8428In04y2IHAMR8BYdUFuTo
	XX0F74qAzVN83PYC79epxJieHbMlBqn7Jr1yykg1gM53bk3Ah7voExAoKPb0xMew01oFli
	vyVbcBVj7tLp22ngl1cbVDRAqchxh7Q=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-rnNKde9fMUOGnVlGCRXH7g-1; Thu, 07 Sep 2023 13:25:13 -0400
X-MC-Unique: rnNKde9fMUOGnVlGCRXH7g-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-48d10c6b0easo460376e0c.3
        for <linux-coco@lists.linux.dev>; Thu, 07 Sep 2023 10:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107513; x=1694712313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/OggNw1/miPktGc+ci31BRP+FmUzQnb0YqvkymMCSY=;
        b=VaUIEcH2L7A0mhNySovNmtesVgeF7fYgrSRP2rkWC+cmnyMmkSgm9FQ2fNiKoGyYbc
         Iv3l0NMM5MPuVx5V8J0mVyxWugTCpX8G61DHcnLuvMR0l5gsEdC5V1K/c+YHkCahYRkt
         xTPwLBWxue9JtKnmdkfLrcjSXyC/XLh1+V44nS4L3tl+0++SDqxUSETTlQih1w0+4yGQ
         XI1XS659ueBqc6ZYW/RyZc1Ktir4yTMAgg6/7sN2kwrDFw3wSKvXQOxo+F9kg9VC6LO0
         8/7c1SEdD+8Uqa0hQ4JIxaSkIDM3V2Dlc1cRosQOleCh3Rhy4W2tRwjLsfNqUo5zTX2i
         4/1A==
X-Gm-Message-State: AOJu0YzEQVTv53y3BgXp3Ar9ZX2FBmt8WVP05gbKmLHeRzxhHKb+Y9Fi
	na79oheyA78Eu/GU40W8xzfOVymnLBGJhhkAEr0rRf2faClg2o0GMLfGdVFWV1zzOEYgqIBUsqR
	QC5MTVhiipoKQ95L1F+1oM1Y0b69HueETNoQueQ==
X-Received: by 2002:a67:fb85:0:b0:44e:8773:8c72 with SMTP id n5-20020a67fb85000000b0044e87738c72mr471111vsr.0.1694107513200;
        Thu, 07 Sep 2023 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxn1D0fWjFQ1Y4HMVqjWJenp+XHu4GQAlpBeL+3lmhOq5kMP3AE5qEO3Ic1zVaOD1QOnI28eqes0wk4MOGHc=
X-Received: by 2002:a67:fb85:0:b0:44e:8773:8c72 with SMTP id
 n5-20020a67fb85000000b0044e87738c72mr471100vsr.0.1694107512915; Thu, 07 Sep
 2023 10:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com> <20230808200111.nz74tmschph435ri@box>
 <878ra0ck4k.ffs@tglx> <20230825134746.k7hkpa3e7wnsuq7m@box.shutemov.name> <ZOjF2DMBgW/zVvL3@google.com>
In-Reply-To: <ZOjF2DMBgW/zVvL3@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Sep 2023 19:25:01 +0200
Message-ID: <CABgObfZE+1AkEPyXzQQCV5Ssho5hMrBvAi5rFdTKNNAAijhRjw@mail.gmail.com>
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
To: Sean Christopherson <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 5:25=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> > > TDX aside it might be useful to have a mechanism to select TSC over K=
VM
> > > clock in general.
> >
> > Sean, Paolo, any comment on this?
>
> I would expect the VMM to not advertise KVM clock if the VM is going to r=
un on
> hosts with stable TSCs, i.e. the guest really shouldn't need to do anythi=
ng in.
> But I avoid clocks and timekeeping like the plague, so take that with a g=
rain of
> salt, e.g. maybe there's a good reason to always advertise kvmclock.

Mostly because users avoid clocks and timekeeping _even more_;
advertising kvmclock is safe in general, so userspace does it in case
the VM is later migrated to a machine with unstable TSC.

> For TDX and other paranoid guests, I assume the kernel command line is ca=
ptured
> as part of attestation.   And so the existing "no-kvmclock" param should =
be
> sufficient to ensure the guest doesn't use KVM clock over the TSC, though=
 IIRC
> TDX requires a constant, non-stop TSC, so it's likely not strictly necess=
ary.

As Kirill said, the guest still has to protect itself, so the patch
makes sense (I see a v2 has been posted in the meanwhile).

Paolo

