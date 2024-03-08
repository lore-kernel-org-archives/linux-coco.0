Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C092C198
	for <linux-coco@lists.linux.dev>; Fri,  8 Mar 2024 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709915137; cv=none; b=KZ1PdxQAr6q2Z7+KFM8eYr57ec6hCM5eYhrw8kJe/qpL0UbG13XE47iScW4jkqB7Zeg7n2Nu+DU14Q2O1uNBW1rrT4NCHywTSInNwtjEabn/NPIpZ7vbg9slyngdQW1XUk1Bou4kaz0JGBCgKB4vFcuqfH9A4ivsLDDxRiw3KSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709915137; c=relaxed/simple;
	bh=bNKllj7mYvx/xxkLemA0fJHMcGlcVpU323BzoEH+uFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POW7jjfUBWpJniPqdcUI1Z8w/mcoCxCih0kGzrZNvjveuwi/Sco+F/F1SdvYriBXW4UR6H1YxKAq+4MTrb/AlEyQ9+/lGP/tQmhyuL66IMw+9gqVAQ5+fFOAntv2MbjQN5mb1uF51gL6h3NpuTF73lc9EY3AcPGGciZSxkQ8DGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=26DMfhqy; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="26DMfhqy"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42ee0c326e8so285171cf.0
        for <linux-coco@lists.linux.dev>; Fri, 08 Mar 2024 08:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709915135; x=1710519935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNKllj7mYvx/xxkLemA0fJHMcGlcVpU323BzoEH+uFQ=;
        b=26DMfhqyTxAEvZyUdFiKSChA04MggaBlMqQhLiAzfbqQKslZIdUNVj+Cj26CoNe73B
         m2bSEeKNNRqaLEE6wN/JaGQHKlWc22Lg2DB+k9TbUK4ZkkjUkjNfi2CcC/69RlB73Gr1
         z/lKRnCkSC2lMJji0WIBiEYb1EDF3OHXYr2J0qOAsw1cZskXyuAz8MU5DrixwxJMM7mx
         sYYBpmUf8vp9af5vbBgemn4Lzvo91PhByZz+F0B/xw4yu3hfjo/XwCFmQBCNkeGqnJU+
         nUPEQoqK2ooIjNK256B/TZBSiSQLS1/JS+vGaWkkR8VWzAH83+MjlkEdQnJxLrAb1dCy
         olFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709915135; x=1710519935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNKllj7mYvx/xxkLemA0fJHMcGlcVpU323BzoEH+uFQ=;
        b=FcwVcZwYbX4xZn0btJW3qZIwryufe7zM9OgCM6pUjxQfLFQh3Fex0zfnnAfieiRvF9
         vb5FBZ108cOvr1+APGGD+iSr0b+/uMnkK/ClyTjmHApsZyNu8UWzczfV5smFZwoPLdhT
         /ABHtVclZS3XGMsmQp8+ynJPJ8e8z0BAziO+5gcTSewimlNwYwwLuFK6nGcBjeUV+Ofc
         PJacezGmeY2Z+Sniegq52Dc1ImdAjPVtmmM+uMG9Uw9TXJuDa8NN8cCEISZk5wdgbHdp
         tmk/yMVNPTDpajHUKqtPzHZ4GNA5f+CXG+OgOYAU0gHOkrpNng/yXqH4E2Gy441eeEMA
         fxmw==
X-Forwarded-Encrypted: i=1; AJvYcCXCNYkt3/Z3pczkAk09YNS1dldmZr669qILCBCuPKsSyy+909kN3im70EFMDEWHw55rwwCeL5DvkcQ/OpXmzxt/vRrsOOc6b/ti9A==
X-Gm-Message-State: AOJu0YyjJp4QR1zdTenP+qbJ8MyQhLM0Y3CjZipA5W7R22YDt/8DMcV4
	LT5gqMC9XJQahHAXJExG1m1uyuff3P8SNTkLczDn8mPCA1MD0d9avq8MFkrIdykFn0QNYXytFDQ
	cSf3XsnfDsUO5FfvBLdMIQmzX96hTuZKR89Bq
X-Google-Smtp-Source: AGHT+IElQ3xjmycZ+6ORMpUoTkFmduy8rLaNpVKLnGA7x+Z+sC1aXJ1BEUZ5RKJmqqEgd0tD5BJWRtLMqwd9EMqbzds=
X-Received: by 2002:ac8:7d41:0:b0:42f:a3c:2d53 with SMTP id
 h1-20020ac87d41000000b0042f0a3c2d53mr675497qtb.20.1709915134720; Fri, 08 Mar
 2024 08:25:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AQHacXBJeX10YUH0O0SiQBg1zQLaEw==> <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
In-Reply-To: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 8 Mar 2024 17:25:21 +0100
Message-ID: <CA+i-1C34VT5oFQL7en1n+MdRrO7AXaAMdNVvjFPxOaTDGXu9Dw@mail.gmail.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
To: "Gowans, James" <jgowans@amazon.com>
Cc: "seanjc@google.com" <seanjc@google.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Roy, Patrick" <roypat@amazon.co.uk>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "Manwaring, Derek" <derekmn@amazon.com>, 
	"rppt@kernel.org" <rppt@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Woodhouse, David" <dwmw@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"lstoakes@gmail.com" <lstoakes@gmail.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mst@redhat.com" <mst@redhat.com>, "somlo@cmu.edu" <somlo@cmu.edu>, "Graf (AWS), Alexander" <graf@amazon.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James

On Fri, 8 Mar 2024 at 16:50, Gowans, James <jgowans@amazon.com> wrote:
> Our goal is to more completely address the class of issues whose leak
> origin is categorized as "Mapped memory" [1].

Did you forget a link below? I'm interested in hearing about that
categorisation.

> ... what=E2=80=99s the best way to solve getting guest RAM out of
> the direct map?

It's perhaps a bigger hammer than you are looking for, but the
solution we're working on at Google is "Address Space Isolation" (ASI)
- the latest posting about that is [2].

The sense in which it's a bigger hammer is that it doesn't only
support removing guest memory from the direct map, but rather
arbitrary data from arbitrary kernel mappings.

[2] https://lore.kernel.org/linux-mm/CA+i-1C169s8pyqZDx+iSnFmftmGfssdQA29+p=
Ym-gqySAYWgpg@mail.gmail.com/
