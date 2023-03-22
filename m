Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1B9476
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 18:24:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id fd25so11695551pfb.1
        for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679509464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3abP9aRA5SDFTYb2FKQAPDQMcZEnxuepNbfrKj7pZ0=;
        b=BippmZicYj7E2EPrzcR4xRmqeOkL07gt3+16AEIhS2LdR27FcEgwf1CvFog/nmLLah
         QcLBJ8XSh6yGaMFyEuuNgOokV6r0Na89SfsxojTwFKEu1NIOVnea6O/IwbpBLHu6If9n
         KknmdoWOF3qoT4NkxnbBLGOwiXuz3H+C97VFgIu1SdTNzMadZgoiibBSCz5qRKOrrLNI
         OQhozHpGYyvGG6azlMmb3nB8RFhW1zLhcVrZWS7Bk51Hrc1H5QnbPnu6mfTdWlRpMmnC
         Rx6fjp6HhUewsbd7lis28zuL4qKZlDr5q61C4vPpriZnObYfzyB499QXJGPQykrnHazl
         K0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3abP9aRA5SDFTYb2FKQAPDQMcZEnxuepNbfrKj7pZ0=;
        b=RdYJa8xvXtETFR0gRjRIwQfN0jFDfqPYAtBarqI5dE2KiSo4CzUCgbx081e9440ymZ
         Uajo4MfucNUsijb8dEv3aAc4Ty9g6uzfELsrW4ywolrd/9huomox6+YsyoVxvqVdjTJ8
         SGAMgJOyJlPWktrBT6YMxjpob2l+S2/4ffo4jOZ8aI6VeMxK9addUtocXZ/UG0R4nc4n
         Ldcpmi3TwHEcP5kTxuA7ZhYygMsKF96Ybma2dddkmT9B1PSj2fB/EqN2573KDNdo0VeS
         p7iKa1zAazpnZjGNW88C0QWXyv7BguBfDP1s+K3UZMurzDNNG2JkbE7njJgCSDwfcfTy
         XNQQ==
X-Gm-Message-State: AO0yUKWBFJ/fbznV9GBlF0gDDs37mDjKl6faGaM/5cPKXM6WKi8bGDpG
	JVEY2dG9Srywl0ZowopVolR36i03O9RiU5Fi2X3FeA==
X-Google-Smtp-Source: AK7set93oCKHMHjNDLqnEsRMEgOQH/x1RYye26sbnKzG6GW6AbkYn7JxzJTQG6PXbVsLuyT56Lb3WcK+zzVLGa7yEwY=
X-Received: by 2002:a05:6a00:2314:b0:622:b78d:f393 with SMTP id
 h20-20020a056a00231400b00622b78df393mr2514427pfh.2.1679509463851; Wed, 22 Mar
 2023 11:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZBl4592947wC7WKI@suse.de> <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de> <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de> <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
 <ZBrHNW4//aA/ToEl@suse.de> <ZBtD/y1En3FqDYxw@redhat.com>
In-Reply-To: <ZBtD/y1En3FqDYxw@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 22 Mar 2023 11:24:11 -0700
Message-ID: <CAAH4kHYykL2Qr8ZWT+dsbuRG+h_h3SpCB=7Nn66aQhhhV6Hixg@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, amd-sev-snp@lists.suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 11:08=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Wed, Mar 22, 2023 at 10:15:33AM +0100, J=C3=B6rg R=C3=B6del wrote:
> > There is of course work building on linux-svsm out there, too. It would
> > be interesting to get an overview of that. We are already looking into
> > porting over the attestation code IBM wrote for linux-svsm (although we
> > would prefer IBM submitting it :) ). The vTPM code out there can not be
> > ported over as-is, as COCONUT will not link a whole TPM library in its
> > code-base. But maybe it can be the base for a separate vTPM binary run
> > by COCONUT.
>
> For whichever SVSM impl becomes the dominant, the vTPM support with
> persistence, is something I see as a critical component. It lets the
> guest OS boot process at least be largely decoupled from the CVM
> attestation process, and instead rely on the pre-existing support for
> TPMs, SecureBoot & secret sealing which is common to bare metal and
> non-confidential VM deployments alike.
>

NVDATA in a confidential setting in my mind needs a whole an attested
sealing key escrow service to really remove the host from the trust
boundary.
Ideally the service never goes down and can have an unbroken chain of
custody back to the original ingestion into the service.
If the service ever has all machines go down, it would have to have
another trusted service of rollback-safe files. That depends on
trusted time.

The service nodes plays hot potato with key replication and has logged
and attested cluster management operations:
*  sealing secrets forward to a new version that was signed by a
pre-registered trusted operator.
*  adding more machines to a cluster that has access to the secrets by
a trusted operator.
*  the sealing enclaves themselves need a secure source of time to
know when the enclave came up and whether it got its secrets from a
rollback-safe sealed-to-code file or will depend on gossip.

Trusted persistence really means there's some trusted workload that
never goes down that is able to take a sealing key bound to an
expected workload measurement and return a secret that will only be
unsealed when the vTPM gets to the bound measurement.

It's a fun problem, one I've been wanting to work on, but yeah there's
a bunch of other more pressing work to do first.

> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20
-Dionna Glaze, PhD (she/her)
