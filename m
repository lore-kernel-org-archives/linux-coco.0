Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A74E23741
	for <linux-coco@lists.linux.dev>; Thu,  5 Jun 2025 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749156358; cv=none; b=dcfDyyZiSGBbsUgS4ZFv66hNoGf6clO9ZdmQfnAfSqoLflBP7JdoJcKsBB+BDVLA0TSkyDcM0nWwKCGw7GKs4H5qOc03c0hy31GdF1cL5KzBrGaSow8EPVcTCfVPLGh9iYn0U/6kergFAcokwh2t8mI0rK4CkaCzXqt9zyby8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749156358; c=relaxed/simple;
	bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOBxpPGkL7nfYlXumiJ/wTQFLcNrliqTnIzMYgweD1KKKKb9f5BwNFHJA9xJQpEki6qqObfo4SEY4IpnFPGBuQRGLsLvyt5koka89OCik4DDXUbBgXw8/Jw4jMblWIPL/8W9sP4OAcv7nAadisQ0h5wqBqgO+k21h5aPjbY5UXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJhwoHLi; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJhwoHLi"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3115a6db4d6so1171451a91.2
        for <linux-coco@lists.linux.dev>; Thu, 05 Jun 2025 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749156356; x=1749761156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
        b=BJhwoHLi8zbZP+8t4sKm31bHN9C/hVPjYl5cu4Tqgz+WIhMQ2TOWD2BkeQ2qhusqp7
         L1I4372qNY9pz0VWRNZnlXPXxLgO0llf47Kxkw6JsGnbAZsngbwKLUU97Rpi7vruiMuv
         oGiHMCdXxeSTWTbF6IjUzJjxI9k8S8Z6dOd47jJ0aGxYSF6BsWnBndwX7fSKz97SrXyl
         TeH4IJkDVXU6QAreh27sYDGkiGMDZAfCBuf2OxtAsFSun/EMtzqkTBB+r+tV97yJrWhW
         2S9T7D+eNGtigzG4kw5JkROBJ9IGTRhtx0VLZpGT+ApI1cClcpa+EcfA262zqiqz4Swh
         w5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749156356; x=1749761156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
        b=v+c9jeWJnviMKmGINQV/S2lZdw9AYdU7mDTE87btTN4rNL6l1awkoY+AQ2+g4CQVJ3
         iYtd3USOXiNvdD76RqyJEZGCP00MC1MpOlMvhDDwngM1SjCudef+WdvH5eY0Oa9GBmCa
         1wTZYQWARhfmahV3I4dwssxIbRV6KW34KWixLbKhVQLJbMrVys7bI6h3HY7m2PRzIL+r
         ZnMirr8wPNiZjjyjSGoTF/gJEMsTrD2Mxz1u10Kdad4i5K/Vf5+dYoWRztmpuHnhjfpa
         8HDj6bFE/zUXabSQF3bYBSYSgb4oessaUCrPGvmYnsE+fPIWpvCOwrtvAM3IO7V84V35
         f+5A==
X-Forwarded-Encrypted: i=1; AJvYcCVYC/qjdRGXu5n5IUKs5MgYd1EMTCwg3nRbz5p7WvzETwsFJ1Nu/yXw0CTGlziJ0Msx74S8NCeCwqA1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj6VeiOhvRKvXKaYWoXfAQe2vB9nxDf4rcncNNoRfI6h/qH6cm
	aCqctRyUtd2Yx9Rd5BO7NG1V3VBWaPeR2XOw5aeEYst7qXY+HUjNsv/O1YuHvh6GaGXyxdiUtTn
	N1IWw6dNCUjXM8T7Ph7Y9xxdan5kh3hmcTdatnLXJ
X-Gm-Gg: ASbGncu8GQLTaI5+fdaR4HeChDdUz51UtXnmooEbMIkjL1LGfXJn3M4e1TYoOAsDgOI
	jfvJ7hXPteX8LxKwrL940Ss5sPQQx7LA2BaL5kW86OEImis3Uon+jo1/5kahIBBIkRrqLG/TuJG
	crcWYZaD4g0zVADuH0mRFRNj2XXsasfzF94eggvI97kX5VJxXumBu1i9PC0+h/wvjIKEoKYx/1/
	A==
X-Google-Smtp-Source: AGHT+IGQEyQ7xC/2gN7AR6mQJWZcHfKlTjNOFZ0aNJuMVhtq7C8GdNK06ZCyXnyWEhtqlam63k1Qx8RM6OmlrSSS9Dg=
X-Received: by 2002:a17:90b:4b4f:b0:311:c939:c848 with SMTP id
 98e67ed59e1d1-31346b44fafmr1785689a91.0.1749156355425; Thu, 05 Jun 2025
 13:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250605150236.3775954-1-dionnaglaze@google.com>
 <20250605150236.3775954-3-dionnaglaze@google.com> <b6b9b935-c5fa-dec6-ec82-56015b5dc733@amd.com>
In-Reply-To: <b6b9b935-c5fa-dec6-ec82-56015b5dc733@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 5 Jun 2025 13:45:42 -0700
X-Gm-Features: AX0GCFvw6StWYSjYMIhscpi25Cgn32D8l5h6WrL5Hb03D2NIE4-XGuR2mkZV11Q
Message-ID: <CAAH4kHaeMgzdNP6Y7zdkdODransNkP4UiQ8ROpCVgenpiveJ_Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kvm: sev: If ccp is busy, report busy to guest
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:15=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 6/5/25 10:02, Dionna Glaze wrote:
> > The ccp driver can be overloaded even with guest request rate limits.
> > The return value of -EBUSY means that there is no firmware error to
> > report back to user space, so the guest VM would see this as
> > exitinfo2 =3D 0. The false success can trick the guest to update its
> > message sequence number when it shouldn't have.
>
> -EBUSY from the CCP driver is an error, not a throttling condition. Eithe=
r

Ah, okay thanks Tom. I'll drop it for v6. I'll see how the first patch
is received before cutting a new email.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
