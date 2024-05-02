Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FB171AA
	for <linux-coco@lists.linux.dev>; Thu,  2 May 2024 03:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714621260; cv=none; b=s/f6yUPbfA2Sf+CPr79n1fU20usqDR0CFcngdBa+5IAyEMQlixcx5cu4mdAZVQm02DtyFRLgE0eREqBQ+5bbYTz64Dq5R5d5vhF8FrlL6mjFXfgQo1Focn7U5qReOjJBN5FdREM1Dt0+14puF/58S0+55iw8JOhT++RnGucSgRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714621260; c=relaxed/simple;
	bh=XRqNXEpahaUKXI6jw1HamILuyXH8geeeaQFQyQE+IP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+rAD23xZmRxkQmAJEoIVGabu8bE1udBhxL6+UMYhJatb+Q5jXsx+hSkGFXmiqnZCsr2SkyNsXLmQcjeVZ/WYmOeiAmdjh+SYsoRERVLT8E4aEE+1x6A8eW3Lext/bTcTODxoppP97stfMxLQPHkvidCq1mgQ+uKbn1BWeHg9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso11534271e87.2
        for <linux-coco@lists.linux.dev>; Wed, 01 May 2024 20:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714621256; x=1715226056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjbdI7aA0VFa2ZjYKTzan8ccV6sWkCqg04GHpcz08yA=;
        b=cpJ0SVdc6kdQBPbwfXW5AtU4E6/VeXm6U0iiteMkeVBlwsUNkJXXqhbC0tOdr931gD
         bFiPT11sK/1JiXdroAE95ybemXAOE3gXVGiInlcR9nTsP5rOS5G5GntKwasf3Q6hh756
         s1uEvsxnL2HExsGBve6KwQ412fT+NfdxO1330mzoWeg7k0+7roPLv9jOUHXEW1xzrFgH
         FjaazbrlfygIBm0q1jndubPOQ8Tzw28ToFb7H1yuTjxmeQ+XjoLj6TMLpe2+/sl6VVnM
         3mEcGnbC06/m7PPd4wlsqUVfwZR46H+SQ5OUqiK6Db+m2kDeeOp85Uqv115JDdLE4eQB
         TZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9+Gy/qf87YnzGvr/bmifI7PkBIvowYk9iGqnfKFer7GPP7Y/8ploetDfILlNrTI0uh0A5uITz5Y4nguricNyhYwUrenkycoNFg==
X-Gm-Message-State: AOJu0Yxj24arNHT3YCme7GDp+jYlMbeueUxVWv8eN8bCeZWTJtVaybw1
	LoNIraT1YH25vj76RiyhYTUDF/IOR/g1WQy8gOkMvpKIobMjswfiWt4Rp4vG
X-Google-Smtp-Source: AGHT+IHYEz+jbVrA3cItWfFgvGooAOhBPT9qbvwhrXyoANn9wamrCvfzFdnn7YO7tsaRHMX3sgjNtQ==
X-Received: by 2002:a19:ca01:0:b0:51f:27e7:a4e2 with SMTP id a1-20020a19ca01000000b0051f27e7a4e2mr298666lfg.58.1714621255676;
        Wed, 01 May 2024 20:40:55 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906490b00b00a525609ae30sm21984ejq.169.2024.05.01.20.40.55
        for <linux-coco@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 20:40:55 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5725cfa2434so2432470a12.2
        for <linux-coco@lists.linux.dev>; Wed, 01 May 2024 20:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXg3Ow27ipY0WpvuzP0QKpOdOoD7gu1UHGn6Dv2sPNHGSZlnaUYr7QlpwNoAnr0VHZeuuzjZEmxsPtL1m0VLoKN2vTXuyrqVUoYKQ==
X-Received: by 2002:a50:d6da:0:b0:56c:d35:1775 with SMTP id
 l26-20020a50d6da000000b0056c0d351775mr3426349edj.35.1714621255210; Wed, 01
 May 2024 20:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713974291.git.thomas.lendacky@amd.com> <e3143c1f3d0b26fcd8884c6f75644b634a7138e8.1713974291.git.thomas.lendacky@amd.com>
 <CAC41dw-g2=jKkevGOJUqnzYTpxQ8+Z_JxnNNuoLR+CM_yqfRzA@mail.gmail.com> <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
In-Reply-To: <6632a2e0738d_1384629442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Date: Wed, 1 May 2024 20:40:43 -0700
X-Gmail-Original-Message-ID: <CAC41dw_Dnm=suyue+jFx2z8f+YT1K_aWfQEijrU=WH4OLWpOqQ@mail.gmail.com>
Message-ID: <CAC41dw_Dnm=suyue+jFx2z8f+YT1K_aWfQEijrU=WH4OLWpOqQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] x86/sev: Take advantage of configfs visibility
 support in TSM
To: Dan Williams <dan.j.williams@intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, svsm-devel@coconut-svsm.dev, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 1:15=E2=80=AFPM Dan Williams <dan.j.williams@intel.c=
om> wrote:
>
> Kuppuswamy Sathyanarayanan wrote:
> > On Wed, Apr 24, 2024 at 9:00=E2=80=AFAM Tom Lendacky <thomas.lendacky@a=
md.com> wrote:
> > >
> > > The TSM attestation report support provides multiple configfs attribu=
te
> > > types (both for standard and binary attributes) to allow for addition=
al
> > > attributes to be displayed for SNP as compared to TDX. With the abili=
ty
> > > to hide attributes via configfs, consoldate the multiple attribute gr=
oups
> > > into a single standard attribute group and a single binary attribute
> > > group. Modify the TDX support to hide the attributes that were previo=
usly
> > > "hidden" as a result of registering the selective attribute groups.
> > >
> > > Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [..]
> > > + */
> > > +enum tsm_attr_index {
> > > +       TSM_REPORT_GENERATION,
> >
> > Do we need an index for the generation attribute ? Since it is a core
> > function, we can allow it by default.
>
> That is up to the is_visible() callback to decide the declaration of
> which index corresponds to which attribute is just static information.
>
> >
> > > +       TSM_REPORT_PROVIDER,
> >
> > Same as above.
>
> These numbers need to match the array indices of tsm_report_attrs.
>
> Your suggestion makes the declaration of tsm_report_attrs more
> difficult:
>
>  static struct configfs_attribute *tsm_report_attrs[] =3D {
>     [TSM_REPORT_GENERATION] =3D &tsm_report_attr_generation,
>     [TSM_REPORT_PROVIDER] =3D &tsm_report_attr_provider,
>     [TSM_REPORT_PRIVLEVEL] =3D &tsm_report_attr_privlevel,
>     [TSM_REPORT_PRIVLEVEL_FLOOR] =3D &tsm_report_attr_privlevel_floor,
>     NULL,
>  };
>
> ...because then the definition of TSM_REPORT_PRIVLEVEL would need to
> know how many attributes precede it in the array. So, defining it this
> way makes it more robust against future changes that want to
> add/delete/reorder attributes in the array.

Got it. Makes sense. It is simpler to do it this way. I am just
worried that the vendor driver might mistakenly disable some core
attributes like inblob, outblob, provider and generation.
