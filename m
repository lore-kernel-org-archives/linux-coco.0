Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99766208967
	for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733941248; cv=none; b=WXcgooK+AjtClE7N6e0bj5HLZ/3TbZcSqo3djkebmy/8zFfRlR3yTuObeCuLwjQZRuilAr9a0dScn4EcrQ5sdmsjleucPajSiQ5E7o1suWlI2uYvam/3jpuOlWhZsUhy0hB81JTZcFTUVVdxSn+UhJJHbUFxMcJW2BoNm6EtWa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733941248; c=relaxed/simple;
	bh=nh2EqG0QBe4JhXIAAErBIY/+LM7vz53IS02/ipEOrVA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hBO2MqH+YI7pYrgMWjrNAShtQUq39BUa3e1NkgEQ4BWdWkxgs4E26eWQJLyGY/RjkbgyB0sT+8zzb9TswWr0irWUrDF+KvHLju/N31yHVw2z369mNyv86masVKb7brkiNsYLSGjt0xFP4LDrI+0vMqZ34kM/M/vwSovSIXccZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=snqNbXD4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snqNbXD4"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so6969920a12.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Dec 2024 10:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733941245; x=1734546045; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nh2EqG0QBe4JhXIAAErBIY/+LM7vz53IS02/ipEOrVA=;
        b=snqNbXD4jw1E03WcCWBB6nSQxYZXRBa+X6tXVb+WBuaKuB+57SusHQZCBex/GFhZbg
         oXQMBAtXsFlD2mZkJqcrQ7vGA9CZAfwTF+KmDtSpa9uYOBm96qPaxHzI/2DOz38hzmij
         AaPdetXNCNaqjhcBBz1e6WFUx0fRZxhlAqU2/gutC/Z0+KDZwLUtZWEfJKsoqYCwGWdT
         uTBd5284e4eYlOVY56ZSKogp/8MCn8NUhKYmail65wk7/SiWRd/FpQ2j9b8udqKIm9xE
         5MtA6C2MtzwVS1FooI8ped5ItXPve9dQ0edZi6IONU+AAs8Kll9fPavXbKoSd6SVuuWF
         rINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733941245; x=1734546045;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nh2EqG0QBe4JhXIAAErBIY/+LM7vz53IS02/ipEOrVA=;
        b=QRDCzM1dtUAkz0gzUh+1ylY0iZWzvuYR2fpMvF53eICdkIsOrp/DQVF8EWo/MQdimg
         IZMWQ/m0g1y2IZHRTxds9lfGTqMdA9dITnHkzT6c8FM53z+viaWYh1at0DBS2WptAujH
         CUQZn+jreTyXokJjvNkZSqfe+RqMza3gMZLn66Pef35Tl8d/mH5XAMk8DNIoP1V+MXL3
         qqEJ/IbUTkxI8E7Pvp8/JoB/CotJlyK/5HvOyd6hLm9KwEj0NwY1Er4CTL3OM7jglXJw
         IvPQ3QEDKzfdoJXUYIr4xNXo4PRrbsOy3oA40eeXnME0w5xpKLbyoOVlWchgL5L76uxr
         5EZg==
X-Gm-Message-State: AOJu0YxTIeQiyrvOjQpg/NYVBXaSJ7LQZQL/nqqfiupYLRoScVVZGgOx
	ZJOV+JGMdn50PvGu+nPtB1JDiVD00UzMhL4HipoONJefhmrhaSdoFB0dwWuxfs9pz3rDkI/e65r
	vyGoSHyvrfGiD6pshI7RYB2MoYT4srA9H5ZpuaaCq+v+m1mbSSAH9
X-Gm-Gg: ASbGncsQEGbKDqzD6I/zbmsP9tnUYmv9XcIUkdDG46UB/sxKcZZba8ry/E727COpjuh
	I6UrNL/re5sNjwkDi5dAGd5m6uUbFRlX9faocWhsEyZSIYYg+Zgn4Vp8S7+CV
X-Google-Smtp-Source: AGHT+IHxQ6z9FR1ReQtjty9L4YXapaFKTo27C3ebClmNg7jPUR/MoAfEqoRjCnXpdl+GpN1rAy8KqFPXp+RMh903Qvw=
X-Received: by 2002:a17:906:3cb1:b0:aa6:89b9:e9c7 with SMTP id
 a640c23a62f3a-aa6c1cefccfmr83436166b.43.1733941244459; Wed, 11 Dec 2024
 10:20:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 11 Dec 2024 10:20:33 -0800
X-Gm-Features: AbW1kvZ0LzJxp47m0LN4R1O7DHXWd9bWOoqrcvJfQiw0Fc1XGn0IqdrmztnAGjQ
Message-ID: <CAAH4kHYdK7X3jZFYaJRrO5gSgF55kxHzweh0epoq+ciPjwwAwA@mail.gmail.com>
Subject: SVSM attest single service binding
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The attestation protocol has two different attestation methods. One is
a GUID table similar to that specified for an extended guest request
in the GHCB specification, and the other is "service specific" as
requested by the spec. Both formats are referred to as "service
manifest", which is unfortunate.

The REPORT_DATA for the VMPL0 attestation for both attestation methods
is SHA2-512(nonce || service manifest), so you can end up with
evidence that looks like SVSM_ATTEST_SERVICES with a single service in
the manifest when requesting a single service's manifest. There's no
tag between the two. There's no requirement that whatever is reported
in the service manifest under a single service's identifier is exactly
the content of the service manifest that would appear in the
attest_services. Even still, it's generally bad practice to hash raw
data. You should have a context string.

I would like to request a change to the specification to add context
tags in the REPORT_DATA, at least for attest_single_service, e.g.,
SHA2-512(nonce || "svsm service <uuid>" || service manifest)

A solution could just be to say single services shouldn't use GUID
tables as their own service manifests, but that's a bit brittle.

Thanks!

--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
