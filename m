Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D668182D7
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236609; cv=none; b=ajDCxDL7b/H4gHZKnAb9lD3EYc19Eiw2xs+lk1cDwWy/l4EEgld+sbdEQ/1Nc2evL4va8P6TPRtuxo7LGOIlGyzRc5NfhlcM9I9UzxALwsBaAcY8OOvNiCswRFJfx/Mt7bH09dmVgIqautwVJMHMCxBaOZfhEb/ysXNVeAGvqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236609; c=relaxed/simple;
	bh=4bMf2krmehBME/JGGSJ2OFdq4bknMLcJ1KY7t6wdCdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHUb8PGVrKhTp8KNMBS1RIE1J1/GKq9RII96Eyf5qZ/D7c3pAZuDdb2xO6oeIURDxX2dj1z7sFnvtCjy7ikREZ+gkbOVpxtM263jsQJPBtrP65wquHbZT9/DK96gD7xdoQ1FEKhw7DQqovKVesuorjLrbldL9JLq7X/MamByqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ycV3aEq0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ycV3aEq0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5440f27da4fso2880e87.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Feb 2025 17:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739236605; x=1739841405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIDLn0ElhLkZLGHEXZdCvG2zMlN0W10JkA618ESIp5I=;
        b=ycV3aEq0FKJyTBccuxXSrsWDjANniPTHZkRVH5d9TmHDIH87WIKeiQUMj9dm65PzBM
         riAC//plu8ZhfLF9go+89xPOOLYibODxcNs6O3/e7+5L11BPaRQS82X6z0fF55D9fhPl
         /Ffp0aYgnSPd3Ja3CvFDiW5StDpOeMLQVhlcXxR0+xEqxluS4FJTDUSpAq2p8RJS63Xp
         Bzgzgkoa2xFegINpVBoGdKN0NsxxsnZ7kbTM5Dph8/rKb6anTO3ZLm2JM7VBoBE0MOkZ
         2oQMVU+lTAvOnJTr+bd8Q0aDuYKjlUQAkBWRbhWK1kXpVPVRU07F6N4BTCOcwmWFEqtj
         9Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236605; x=1739841405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIDLn0ElhLkZLGHEXZdCvG2zMlN0W10JkA618ESIp5I=;
        b=aAv7Iou7CxYCV+WTOJcifA3lIexofY7S4RUmPlNe9kYFxD79UiufyJD80Z6TnnEwr7
         gkXTkNtpVXHo+7BNPKhzj1NCGsbIAAaE9L7Oc+DcmZ95JzL3Y8Vqg3THI+MRfxI6Oh6J
         wOVZOWqkixExoZpSIALCWfhPiqNDQwFvc7X3geVH15kL93FyGIVDFcXbRxaExp0NkInV
         MIhAUyKpizON9IidpRjsnPlZkspYpdWO0yEtOku9YbnG46W1vBpWvNqIYdRQnv5XV4ny
         yj8LdE3F67LoVUtiQZjd0uoCec7ht8p13hKoAiLP0piJb4XjxUwskEj4xiGQBtvs6cQW
         ge2w==
X-Forwarded-Encrypted: i=1; AJvYcCV6WpXw4h+pbyN6azVSDxmcl3twIvmz7qednU+WOxggCXrxTHi0XxWp3k5f4Qmd+Hfii/RYf6WrNYaH@lists.linux.dev
X-Gm-Message-State: AOJu0YwMs74tEgvy70uzy3+0J78CRSJZ4XM/p8pNt2obu3bnq1QGcmZq
	6R/ON1h/wBT14BSDADWV3+2+kSBuwh0YUsr56Y62SHKxP0i9wtz1Kth3UprEt3V5ReC7qvpMlec
	uM3XqYZFAcbx1vQ6p+nsQyqp56Z99b6SPiAeJ
X-Gm-Gg: ASbGncvhD31OG8uySXR05ntWzEPjdeu4pOtDYUj7ZxCBYu8WdXZ7oxYExphgrO5P8Qb
	aIf3yFqeKh7UszQvqz3JB7/RCbvesvkYscyWsx8hg9gFplONXYoNAnCcmK4x0WTYXSKyFaZFes0
	PQyAGAPinujInTRu6Ls2DnD1p03m0zCw==
X-Google-Smtp-Source: AGHT+IGrKDG92DdGOlwP7eJ/9LFEBgOFycMhnxSp1JHwnKefb0ClNrqUUYEZEfsa6sdnN6IhjulSH17jSWCq6Fyov30=
X-Received: by 2002:a05:6512:1387:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-54513af6b32mr59896e87.7.1739236604383; Mon, 10 Feb 2025
 17:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241212063635.712877-1-michael.roth@amd.com>
In-Reply-To: <20241212063635.712877-1-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 10 Feb 2025 17:16:33 -0800
X-Gm-Features: AWEUYZnu8DZ9-gWy_ugkJ_6BkgXs-pViupxKo87Cy1AcHvUKcORw34feJYU-gN0
Message-ID: <CAGtprH9ehiz+yKfQqj6JeObaPv0DPUsoAH+YVdSeuzL9zhw9tA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/5] KVM: gmem: 2MB THP support and preparedness
 tracking changes
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, jroedel@suse.de, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, amit.shah@amd.com, 
	pratikrajesh.sampat@amd.com, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, ackerleytng@google.com, quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 10:37=E2=80=AFPM Michael Roth <michael.roth@amd.com=
> wrote:
>
> This patchset is also available at:
>
>   https://github.com/amdese/linux/commits/snp-prepare-thp-rfc1
>
> and is based on top of Paolo's kvm-coco-queue-2024-11 tag which includes
> a snapshot of his patches[1] to provide tracking of whether or not
> sub-pages of a huge folio need to have kvm_arch_gmem_prepare() hooks issu=
ed
> before guest access:
>
>   d55475f23cea KVM: gmem: track preparedness a page at a time
>   64b46ca6cd6d KVM: gmem: limit hole-punching to ranges within the file
>   17df70a5ea65 KVM: gmem: add a complete set of functions to query page p=
reparedness
>   e3449f6841ef KVM: gmem: allocate private data for the gmem inode
>
>   [1] https://lore.kernel.org/lkml/20241108155056.332412-1-pbonzini@redha=
t.com/
>
> This series addresses some of the pending review comments for those patch=
es
> (feel free to squash/rework as-needed), and implements a first real user =
in
> the form of a reworked version of Sean's original 2MB THP support for gme=
m.
>

Looking at the work targeted by Fuad to add in-place memory conversion
support via [1] and Ackerley in future to address hugetlb page
support, can the state tracking for preparedness be simplified as?
i) prepare guest memfd ranges when "first time an offset with
mappability =3D GUEST is allocated or first time an allocated offset has
mappability =3D GUEST". Some scenarios that would lead to guest memfd
range preparation:
     - Create file with default mappability to host, fallocate, convert
     - Create file with default mappability to Guest, guest faults on
private memory
ii) Unprepare guest memfd ranges when "first time an offset with
mappability =3D GUEST is deallocated or first time an allocated offset
has lost mappability =3D GUEST attribute", some scenarios that would
lead to guest memfd range unprepare:
     -  Truncation
     -  Conversion
iii) To handle scenarios with hugepages, page splitting/merging in
guest memfd can also signal change in page granularities.

[1] https://lore.kernel.org/kvm/20250117163001.2326672-1-tabba@google.com/
