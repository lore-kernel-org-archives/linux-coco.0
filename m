Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01E15A9
	for <linux-coco@lists.linux.dev>; Wed, 22 Mar 2023 01:29:41 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso18025159fac.12
        for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 18:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679448580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSCyyhzST23ex5r5AgFi+RlkaLf2K1PVz0O5N4A+Lbw=;
        b=jzf02hDKsUrLyp3O5LE12aIO7p14qRl7n6B5pP2Vba01AI84MTd/duAFs38nhOlpy2
         b6gKkomiMXft8nEsnwtW2nOXrXcs7CGM5h7d3V/vi3QYX8M1O28gNcsLeU2geT//PJb/
         J3TwOhGyBvDPf+fgQl/2gKMJ73lNZAozmCOQBz9CXiQ+7eMIgDYK1UjpN2Skq84pCZMh
         abD0ZeX+2thleQLRjVKr3gS5TpqEqKiuoHDlW/hTNS2ikvS/4LHElynzDKBlrjuW65iO
         FRemaTLVSwXVN3utHWpPvCSVGv2xK/XWbm1AiyEBI8bHOqxGq0cS8BVXqOL9QvKIBFzJ
         uD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679448580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSCyyhzST23ex5r5AgFi+RlkaLf2K1PVz0O5N4A+Lbw=;
        b=SogvfGeQ21LQO8QumiGfzC5C1I2pLOvRiGagewA9o22NOwk6nUgRTYMLIGiNmUfMtM
         bsqzZkRatyJTzYxDdLligGk8Ja9vjn73HXrfh68V2LbNCAaiHaWZlSXBnSP5qGFHGkWl
         lUvy4kLT+zlRWps2LZXTGcrWLUGDk4jYmHGggWgHmmTVyqVDnnvaNRbE5AeW/EKtlBSL
         twvqXzDQnIXFTiTaZU4srFI/LS37JRXkvBik4DeXPlBFhXQqLsrHntG8bp5fx3l71Wu3
         H+HbxGXoEJdMw3jCh/x+cJBXWM5QlvLjmoGsqFFVmAJTqCc9R20z4iLLXE+0I8zUpkzg
         m0qw==
X-Gm-Message-State: AO0yUKULDxgpHTx9rfW2sVKybB4MmC+IRAsOHVgbRn0zpS8nLXZG+grf
	me/RCC9x3l4NEPmHJSFNfKBLNeIiUu4UzreWrVmXZg==
X-Google-Smtp-Source: AK7set/ysncTXzUcWP1joJZ3auqDbvvUbIdr0nTvGVzzXRrd9cUIMlK/G+vacoJa+sl7uH4lMvdqANYtbw21s3MGGJI=
X-Received: by 2002:a05:6870:df97:b0:17b:f094:5478 with SMTP id
 us23-20020a056870df9700b0017bf0945478mr390201oab.2.1679448580241; Tue, 21 Mar
 2023 18:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZBl4592947wC7WKI@suse.de> <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de> <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de> <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
In-Reply-To: <7d615af4c6a9e5eeb0337d98c9e9ddca6d2cbdef.camel@linux.ibm.com>
From: Marc Orr <marcorr@google.com>
Date: Tue, 21 Mar 2023 18:29:29 -0700
Message-ID: <CAA03e5F=Giy5pWbcc9M+O+=FTqL0rrCWSzcgr8V2s-xqjpxKJA@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
To: jejb@linux.ibm.com
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, amd-sev-snp@lists.suse.com, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 1:05=E2=80=AFPM James Bottomley <jejb@linux.ibm.com=
> wrote:
>
> > Of course we could start changing linux-svsm to support the same
> > goals, but I think the end result will not be very different from
> > what COCONUT looks now.
>
> That's entirely possible, so what are the chances of combining the
> projects now so we don't get a split in community effort?

Very cool to see this announcement and read the discussion!

One SVSM will be better for Google too. Specifically:
- One hypervisor/SVSM startup sequence is easier for us to get working
- One SVSM is easier to test/qualify/deploy
- Generally speaking, things will be easier for us if all SNP VMs
start running off of the same "first mutable code". I.e., the same
SVSM, UEFI, etc.
