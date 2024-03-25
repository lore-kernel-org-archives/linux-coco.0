Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685441F5F3
	for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711380552; cv=none; b=deqcl+15rkWle7GyE/UNOPBEuLPX1BRRGxfOpEXy3x+SiAwIBlLPA/1D62/GELFUL2wdGqXMoTpTSiFsc9U3hHzwnYeEuP2H94oFvQXp7kawMrvAEp0Y3BaO4aA8YAsymhvo5j5qD9Unovpih7iassmDYDx1uKap2XFySrAWXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711380552; c=relaxed/simple;
	bh=im0r/VPFlCPZusE4oQsVY9J4lWIP4Ymkchn+ok81tWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCYOFyjZSox5I5RaYq8r7CNLude2K6Dv4hdnb3+Yg4I9WXu0IEkamZ/xBDj+DQHA0N9zq8guwyG0UvGeTgXKKf5nc3er7iM979VndyfVEP8kDn97HO0L6Ps2zONchCrdTieSRv7Wz/HSeLZfP7ceUYW84D/raJuHblu7f1nMsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oufwyqzb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oufwyqzb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bde8ea904so18282a12.0
        for <linux-coco@lists.linux.dev>; Mon, 25 Mar 2024 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711380549; x=1711985349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im0r/VPFlCPZusE4oQsVY9J4lWIP4Ymkchn+ok81tWA=;
        b=OufwyqzbZ/Y7cXyy5OPa6OCqlwmLGFsYwiXbMB0ZiGkQn4V4MhcoGFG4W7y+zb3wTU
         5sbKEgM384oVVm1wS/QPkcA7GrbgTIF7c/c7tjwBly8KMUL4n1AVjn8+4q3IkeLCZKIC
         xkuh6f+YuykgFL+5MLCKIv8sNz9R2lalf7TGdWvHPUyqBmutOwn5jUJ6//bOX46m4kJM
         GQpY39DSE/SUIcPsNLm1x2f4PBt4E5WBJ/ke4AB2i9dX6LkMYTKARWdbA216EIMStAML
         l+5vUlpp741+GFJyjD7Pyyd8ATVtSmqozEnJ0OjixO2VjI1wMqO/1eGfi7WPaPzGmkgd
         ZqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380549; x=1711985349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=im0r/VPFlCPZusE4oQsVY9J4lWIP4Ymkchn+ok81tWA=;
        b=PNR9MYCL3Sf0P6NCRdFXqG8AYZje8C56AZ8YyIlOpy7Z70LZ/JQnwqrnD83x6hXfPh
         +7V/QXAtw+lTNcgxbnHRXfs60201DS66IjRVMNttwkQjeH5tkzYu2jF0mc1EuBREJkxi
         Rih22jYkxrKJVFg+s6fCQ0wp0u5SeL0mVYc1lj6O4/Dj5VwcfpKrrd6kY2RoKc6BWgWf
         MtZSmboxQOsXrs5PxVKp05/yg7LDqcu/4Hd+EBAPzm8yH0/ZpFkYh7qFCXZHMQ56Dfce
         qZTZh9F+4U63omJ5F71iierLPTbf41bbVPDFAijeGHgTaVLx7HH9j8aoxWZi4D4JAx94
         m5vg==
X-Forwarded-Encrypted: i=1; AJvYcCU67FKsJVyJ7Upg13fWg4NBP5lGAFkKI9GtQiEBEjRDP2NVVn4FHugIqNBo2qGqN85kyXQXmvkc7T9ADqLV6n65sEJ+tZQOqNijLQ==
X-Gm-Message-State: AOJu0YxTsBuu6/yE+HB1kx5inNBVM9poIa0kRsbmLW46OnPHrXpPDykF
	8ApNJ7lvSNGWDlpDPuLVYSjsrFzPuywQg/1LyjrAjxvnxkyOWCV5o8fRr+FqqY6DYy5ZCbS0I7S
	Caryr5x7EtNmy3mnmnUmfE48Da1W6sFlyVk37
X-Google-Smtp-Source: AGHT+IFpqflVgVTUXihee3xrpVsWhSlvEH1aIPr32YOZa4JnoRA/iVmWC9sloN6Yf0ZWfeod3zX7SsfL6RJ+Wf6Hars=
X-Received: by 2002:aa7:c441:0:b0:56c:d96:8db2 with SMTP id
 n1-20020aa7c441000000b0056c0d968db2mr148005edr.6.1711380548383; Mon, 25 Mar
 2024 08:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com> <ZgF3ACjFj8LtUWgv@himmelriiki>
In-Reply-To: <ZgF3ACjFj8LtUWgv@himmelriiki>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 25 Mar 2024 08:28:54 -0700
Message-ID: <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Yao, Jiewen" <jiewen.yao@intel.com>, 
	qinkun Bao <qinkun@google.com>, "devel@edk2.groups.io" <devel@edk2.groups.io>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:07=E2=80=AFAM Mikko Ylinen
<mikko.ylinen@linux.intel.com> wrote:
>
> > >
> > > Looking at systemd-boot I see it will likewise not measure to both RT=
MR
> > > and vTPM, but with reversed priority (use vTPM not RTMR in case both =
are
> > > present).
> > >
> >
> > Interesting. Thanks for this report. We'll push for the changed
> > semantics here if the spec is indeed changed, and request partner
> > distros in the CCC to include the updated systemd-boot.
>
> FWIW, my RTMRs patch to systemd was merged quite recently so it's not
> included in any systemd release yet. (It was mainly implemented for the
> UKI case that allows TDVF to boot a UKI image directly and then have the
> image sections measured separately.)
>

Thank you, I've proposed a change in
https://github.com/systemd/systemd/pull/31939


--=20
-Dionna Glaze, PhD (she/her)
