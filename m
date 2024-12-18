Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AC1FBE8F
	for <linux-coco@lists.linux.dev>; Wed, 18 Dec 2024 19:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549052; cv=none; b=ZbkxXsfgT4Szu3Xk3+HY0ZV6sONO70EdYrkIb5NoCQ5dPYuTznkQ80Zc21z/hen7J/INw9SOYvTmqLLW8n5mZ5DjWIriJ+HcTVONfHRfXLyexZ+zUvoFEQ6jDNAe9VJCodSdjlDRytxjEJc3kno90CRWH4EuA67ffnJRWpnT2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549052; c=relaxed/simple;
	bh=jMj1OzrDjIrxeMoYOsAPw/b7S6pBg2XX6eTDS2vTCUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h47WbF41dJPWhnbxC5Mg+MCh+nVM09SaQHBPeneWMyplZCoMcYSUnbiFEpslzuhAO2+x7/JdECk4iLLmiRywZZdfhE9gO9rLAsviwWRF4S2WW8EXiMrlo95DkI+TlovEeUHw68xu2np8nzcEjc1XKSHeYd0HsKBmb/T+FdlyyOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vFixf0I4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFixf0I4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725f4b412ecso33123b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 18 Dec 2024 11:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734549049; x=1735153849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YClUdPoywXVSqRLvOMBrpQD/YaQSG0s79CHQrCDEw+U=;
        b=vFixf0I4Og5zaYGg1ZKCpTChmjf4O/jHPfwDaaZ05+B2af7S4GYBVf7gt0eEOFc4HD
         B7e6qFdjQm+u2HfoGqYyi+mVuvRFzyL7Uj8rwbgWBADeUoLJfhUqzGQ+cWXSz9b6nq+P
         NWyBqZBj57DLDnxsgku2AD+sZprhU3LJ9bm+EzgsQBqTmYFyoKlQeoUZ5Cc//JHGRh4i
         i3GESPor3ApJD7fe0Qis5eylFhnc73f31wzdKK1V3fnmV1rhLmsWECXqX4VveJmYyunu
         E5wS0DFHh6a1b2Snq5g0mANBfGXsHGthqz6MLWQiqHy4xfpC2MDKMN+hxRHsUvqk64bs
         ttSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734549049; x=1735153849;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YClUdPoywXVSqRLvOMBrpQD/YaQSG0s79CHQrCDEw+U=;
        b=CsOOHVqFPGYDwYqVGyB1LCM6SkWmu6p5y+2UV0TgUDAxZLEvwO4Wz+8hdaS2louW8E
         7aVevLkv1zoqATlmXC4Bc0BE4CgWOl9lm6XpaNflfni3uTO5fwBYTkonhywxhgnPXChe
         bkm8DdhKRyHufQzknJwacAH/hrJ+Bb+lVTp0ZFGMzjpQSCKMkTgXmIUFmR3Zn+ZpWs3P
         /Cou4wTRvQGNNc7ZMNJp9bCiZdyOlJFWyslQlQU2GzbNBhpnjadtmV/f6n+krRJSL5vo
         GibqQzdF9DmhtbwzKwGttwymSpTMf9g1yzRW1xJuL0rWSuHP8GleQDX6K4NTMdOLKez4
         NgXw==
X-Forwarded-Encrypted: i=1; AJvYcCWdqmRznveLPAXt621SUJz2V8rkwGAq/XKi07eH6aQzYKbZ2Lo8tQwbTokImYphjoPrrrt2/tUpHgPw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxns+xpNxDtwE+Hjp37nkr0hJLkYtmI8SZP2k8OV0bnGoG6Anmv
	hhL3HDI0WjCevhcllJipNdeucn2+OmIxutCys/ZMBmFDV6vGHEZR1ILoPh/rZAE4WIgz3IaRVIo
	3sA==
X-Google-Smtp-Source: AGHT+IH1B/bbkp0G6ABRo9fqVZ6adP+tKt8f/j21FuyOVEbiorHToFEL5buQ5JKv3Q2UPzxlMkYtWT3lSj0=
X-Received: from pgda26.prod.google.com ([2002:a63:7f1a:0:b0:7fd:561e:62dd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e68f:b0:1e1:aa24:2e56
 with SMTP id adf61e73a8af0-1e5c76afd3emr528641637.30.1734549049187; Wed, 18
 Dec 2024 11:10:49 -0800 (PST)
Date: Wed, 18 Dec 2024 11:10:47 -0800
In-Reply-To: <57d43fae-ab5e-4686-9fed-82cd3c0e0a3c@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1734392473.git.ashish.kalra@amd.com> <CAAH4kHa2msL_gvk12h_qv9h2M43hVKQQaaYeEXV14=R3VtqsPg@mail.gmail.com>
 <cc27bfe2-de7c-4038-86e3-58da65f84e50@amd.com> <Z2HvJESqpc7Gd-dG@google.com> <57d43fae-ab5e-4686-9fed-82cd3c0e0a3c@amd.com>
Message-ID: <Z2MeN9z69ul3oGiN@google.com>
Subject: Re: [PATCH v2 0/9] Move initializing SEV/SNP functionality to KVM
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024, Ashish Kalra wrote:
> On 12/17/2024 3:37 PM, Sean Christopherson wrote:
> > On Tue, Dec 17, 2024, Ashish Kalra wrote:
> >> On 12/17/2024 10:00 AM, Dionna Amalie Glaze wrote:
> >>> On Mon, Dec 16, 2024 at 3:57=E2=80=AFPM Ashish Kalra <Ashish.Kalra@am=
d.com> wrote:
> >>>>
> >>>> From: Ashish Kalra <ashish.kalra@amd.com>
> >>>
> >>>> The on-demand SEV initialization support requires a fix in QEMU to
> >>>> remove check for SEV initialization to be done prior to launching
> >>>> SEV/SEV-ES VMs.
> >>>> NOTE: With the above fix for QEMU, older QEMU versions will be broke=
n
> >>>> with respect to launching SEV/SEV-ES VMs with the newer kernel/KVM a=
s
> >>>> older QEMU versions require SEV initialization to be done before
> >>>> launching SEV/SEV-ES VMs.
> >>>>
> >>>
> >>> I don't think this is okay. I think you need to introduce a KVM
> >>> capability to switch over to the new way of initializing SEV VMs and
> >>> deprecate the old way so it doesn't need to be supported for any new
> >>> additions to the interface.
> >>>
> >>
> >> But that means KVM will need to support both mechanisms of doing SEV
> >> initialization - during KVM module load time and the deferred/lazy
> >> (on-demand) SEV INIT during VM launch.
> >=20
> > What's the QEMU change?  Dionna is right, we can't break userspace, but=
 maybe
> > there's an alternative to supporting both models.
>=20
> Here is the QEMU fix : (makes a SEV PLATFORM STATUS firmware call via PSP
> driver ioctl to check if SEV is in INIT state)
> =20
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 1a4eb1ada6..4fa8665395 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -1503,15 +1503,6 @@ static int sev_common_kvm_init(ConfidentialGuestSu=
pport *cgs, Error **errp)
>          }
>      }
>=20
> -    if (sev_es_enabled() && !sev_snp_enabled()) {
> -        if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
> -            error_setg(errp, "%s: guest policy requires SEV-ES, but "
> -                         "host SEV-ES support unavailable",
> -                         __func__);
> -            return -1;
> -        }
> -    }

Aside from breaking userspace, removing a sanity check is not a "fix".

Can't we simply have the kernel do __sev_platform_init_locked() on-demand f=
or
SEV_PLATFORM_STATUS?  The goal with lazy initialization is defer initializa=
tion
until it's necessary so that userspace can do firmware updates.  And it's q=
uite
clearly necessary in this case, so...
