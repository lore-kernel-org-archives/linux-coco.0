Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB68C0C
	for <linux-coco@lists.linux.dev>; Wed,  2 Aug 2023 15:35:14 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1bbf8cb6250so35661835ad.2
        for <linux-coco@lists.linux.dev>; Wed, 02 Aug 2023 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690990514; x=1691595314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXA1T7JmGWAKlz5WKva9qUA0PJ5k+FcRMYlr91yxr48=;
        b=D3fnoaDpZUpNIlEzEToa9M5NzywC6YIAClOVJofmNGb6sBymqzpUl020a0fkM7Lgfg
         z25G99v6iv1YAnsZ/BFa+MTw/mH0mP1hgpall4CV4hwF9F7EeTQWxrd1xbw+w7F1xCHr
         wtQRcogrKxMajobaWxkZiR3K7a13PNNll44tZXYHarWcITHtj26ryHAFpt4LAt7Gf1Hb
         6loLLGW2CHDCqIfBBeJBaCPSA9wKvLVhzfGvyriHqkJ5cJnnfo8omV3sSjuOwiN6Trg3
         fAYPsqVYnQ+DP/dHPtUVw67Mb80fzgK7JLep1TPodfszFZragjtTDUbqvNnqiOtNau9n
         8U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690990514; x=1691595314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXA1T7JmGWAKlz5WKva9qUA0PJ5k+FcRMYlr91yxr48=;
        b=bh4e4xDkLUXwbFb+ZExWW4LkKVI2icw/zzvYqEYsexXNzgyndK3+GfOM1ILm8cflDT
         CjVlFrvWX/WMfd5lxr9L2m7EFDJq+7doERFoazMNSzm6LOHOtiFrO6OmqXt4aJk98bbK
         +7jB/6k3rkGpaj6Ea6zLkEwFr5BlxpIUwtISw40FEH8ee7xzm+ExuvYh46lt2j2h3PS4
         YDwpTJzLbL5J/Rltun32CcMq+kecVYRKSJoSn3rKBLj7OMxSAsuwq2l9bgAzHJnbMtix
         XgnCH4Hd04YjIfNB6gw4YyqUNjmlZb9PuF+Gp6lUqviDs1kXey5mi7mC73rXNfghiC6g
         XUOQ==
X-Gm-Message-State: ABy/qLZtQ5hBEFKpvRcxhW4nFUzOjGZoZcVcGx6klZxLxKyqezzAxR9A
	a+bgiGbqlW1fjy6uqPxbPCuskph82o8=
X-Google-Smtp-Source: APBJJlHn97JVmgEHjSZ1QCk6ntpQDQXEI5zlONaDToQeNFXiL+XQaOZdDpcXDxYBkRUEAvZ20MDyrhoHRZg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea08:b0:1bb:c7c5:3eb6 with SMTP id
 s8-20020a170902ea0800b001bbc7c53eb6mr90737plg.7.1690990513727; Wed, 02 Aug
 2023 08:35:13 -0700 (PDT)
Date: Wed, 2 Aug 2023 08:35:12 -0700
In-Reply-To: <7b4d5df0-f554-2fc0-5c19-021f8eb3f6aa@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <8eb933fd-2cf3-d7a9-32fe-2a1d82eac42a@mail.ustc.edu.cn>
 <ZMfFaF2M6Vrh/QdW@google.com> <4ebb3e20-a043-8ad3-ef6c-f64c2443412c@amd.com>
 <544b7f95-4b34-654d-a57b-3791a6f4fd5f@mail.ustc.edu.cn> <ZMpEUVsv5hSmrcH8@iZuf6hx7901barev1c282cZ>
 <ZMphvF+0H9wHQr5B@google.com> <bbc52f40-2661-3fa2-8e09-bec772728812@amd.com>
 <7a4f3f59-1482-49c4-92b2-aa621e9b06b3@amd.com> <ZMpwiSw9CBZh9xcc@google.com> <7b4d5df0-f554-2fc0-5c19-021f8eb3f6aa@amd.com>
Message-ID: <ZMp3sAQqRlNYqfwr@google.com>
Subject: Re: [Question] int3 instruction generates a #UD in SEV VM
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Wu Zongyo <wuzongyo@mail.ustc.edu.cn>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 02, 2023, Tom Lendacky wrote:
> On 8/2/23 10:04, Sean Christopherson wrote:
> > Side topic, KVM should require nrips for SEV and beyond, I don't see how SEV can
> > possibly work if KVM doesn't utilize nrips.  E.g. this
> > 
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index 2eace114a934..43e500503d48 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@ -5111,9 +5111,11 @@ static __init int svm_hardware_setup(void)
> >          svm_adjust_mmio_mask();
> > +       nrips = nrips && boot_cpu_has(X86_FEATURE_NRIPS);
> > +
> >          /*
> >           * Note, SEV setup consumes npt_enabled and enable_mmio_caching (which
> > -        * may be modified by svm_adjust_mmio_mask()).
> > +        * may be modified by svm_adjust_mmio_mask()), as well as nrips.
> >           */
> >          sev_hardware_setup();
> 
> You moved the setting of nrips up, I'm assuming you then want to add a check
> in sev_hardware_setup() for nrips?

Doh.  I like to think I would have noticed that I forgot to add that check before
postinga patch, but I give myself 50/50 odds at best.
