Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD953009D3
	for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455976; cv=none; b=uhOAIaO3YWJ5qCjdcUf+GoYosGblIIsQ8gNMJJ9Fn3YaQcDdvaiAAXUJDn9ay7ZA/G8IgdXYCqupoyjyxtr9zVjjjaY9hbxNVHSttO9ji47R2Zsab8kHQuommzPE4AK+wpo/ZkuLcOVjWG0GH0Ua/MnWMGWCjRBoqlXwqU+I7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455976; c=relaxed/simple;
	bh=ffMm7Yz/8R6++TIbdHHyZXzHcqpQpJ572eW2FXJszR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hz8zbHonYosgcKUqyEaTiAiCcVG1nlHpG5TKgUTbfOqPTkk/gECogJB4PuqzQEoCJKxTuHGpk3b6pGRJ6Af+f7f4w5oWpAW7ScI0+Riwg7M5FLFM9jPi8rlWwwN11/+7h6XpeZ9yKTAZ9WeDopxiIEtVyYMqUMaxqFE8UEAoThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OeqZBsGz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OeqZBsGz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d67abd215so700415ad.0
        for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760455974; x=1761060774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffMm7Yz/8R6++TIbdHHyZXzHcqpQpJ572eW2FXJszR8=;
        b=OeqZBsGzvkleQb7z5PolUhAvoXVT/GTw0V6tPxMHBqEN9CdQKJMDHp1zICCEoDc0WN
         YtEydVJgGAngS0mv1vksVp0+RC3VTiDHU1MWeDR9PWw8e89fLiDUrP9+SVdOvVWt9QRI
         zkCNHCa6N/6Ood1fZHLk+5Q+iKRj2wByDA/HkFBBsX44tfN0L24MkJSmPhysS3e4kIiy
         3cELXNFurLZvYBaXDuvLpj6yeVp6p05UZeVUZ8Y6fLOPo47PyxQ6A0zbUZwXkLLM3Z1Y
         /DV36zlJ4/oCJfqkcH8oOnnc3pZT0xf3uuzzBzuzzjeQx/DKcfRoswMjumv7ujWqyIwg
         If3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455974; x=1761060774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffMm7Yz/8R6++TIbdHHyZXzHcqpQpJ572eW2FXJszR8=;
        b=luZ1c1BNYUS0DRRUudRmzKiKxW54C8Q4Mi/jvFyoJaRlUAHkTQFEIFQEC68y/oFkSs
         fYMlS9Y+XkKjz5mgvpUQBawpT4R8U0xZk0MSs22naoQS5PQXV7CCHA7CJ37jyYV1Aku7
         mtvO0y/OOxM+dK8soukf52Ah2qPcGrmFsT00H+3yqQaxSypJnDCeMV3HzyDOe+YF1gS2
         Oj6i5q90HLysPUYY3dxFfu/DgxBs/vVvOF4qM3m9GMAtW8aYaol7BEHSpdmgXC8zKSHI
         bqEPVufRRgVi8/D1xZB87YCB1LuTIpgZJj1qz7A0s5b38OW/y9Qgv0jcojnRQ3onj4iC
         G5KA==
X-Gm-Message-State: AOJu0YwEDyz2yH71jDIWghaGy1Bj+M2ONJR9azHkxOwqHAbGs0z/T0Y6
	5+os44XPyI+IZAmnB9ZyzsngiEYrLrQcmVdaZA9EFA/yKdD9rxGH90G7U9kY93fyiGnPSS4fGcS
	iqka3yMrKJ6tAyy37Z7HXVkTW+wPNrgoiXnM1QfcA
X-Gm-Gg: ASbGncuthaBNbxWpnvPRsOVFUg5QktohToBmeuGIbPwgELl65LTk9r4cHaG4ykIv7iK
	IDNuJaZFRyABrt9XAzewzpdaDva0XgQu/IAlqhj3ZpEIQ5kdIJJMLHLH33JSiOt1nrrLeiJkvZt
	ds7RWjaXN9xFp6SYTBxuY9sBOyDibU8Ux8b20M6vp96vkixW+NMcuprG6FVBWp3rGwDeRMNtNxx
	n3UKpS6BUjZv2YIzsEN5RxgFgG6V7DK9ISumd/xbd0nMSOR83ksXVWH0bSCCkBeuA==
X-Google-Smtp-Source: AGHT+IEAXjuXRHNCvILZZPPXn4sZcsg04QiZ30ePy7vGF1dqT989ZMiDUdgA08TDD1m+Fpg7VX5rBjRBfRSp65lsydc=
X-Received: by 2002:a17:903:38cf:b0:248:7b22:dfb4 with SMTP id
 d9443c01a7336-290276dfef2mr26574225ad.16.1760455973795; Tue, 14 Oct 2025
 08:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com>
In-Reply-To: <20251001025442.427697-1-chao.gao@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 14 Oct 2025 08:32:41 -0700
X-Gm-Features: AS18NWAyr_emv0Wn0qKZu1kQ6rVRMX-wPuzsEhtIUlCqjC0fqdcjdn3Vc6NfpwE
Message-ID: <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com, 
	dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com, 
	paulmck@kernel.org, nik.borisov@suse.com, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 7:54=E2=80=AFPM Chao Gao <chao.gao@intel.com> wrote=
:
>
> =3D=3D=3D TDX Module Distribution Model =3D=3D=3D
>
> At a high level, Intel publishes all TDX Modules on the github [2], along
> with a mapping_file.json which documents the compatibility information
> about each TDX Module and a userspace tool to install the TDX Module. OS

[2] mentions about a limitation of doing runtime TDX module update:

"Performing TD Preserving during a TD Build operation might result in
a corrupted TD hash in the TD attestation report. Until fixed in a
future Intel TDX module update, a host VMM can avoid the problem by
not conducting a TD Preserving Update while TD Build operation is in
progress."

Do you know if this issue is fixed already? If so, what version of TDX
module fixes this issue?

> vendors can package these modules and distribute them. Administrators
> install the package and use the tool to select the appropriate TDX Module
> and install it via the interfaces exposed by this series.
>
> [1]: https://cdrdv2.intel.com/v1/dl/getContent/733584
> [2]: https://github.com/intel/tdx-module-binaries
> [3]: https://lore.kernel.org/all/665c5ae0-4b7c-4852-8995-255adf7b3a2f@ama=
zon.com/
> [4]: https://lore.kernel.org/all/5d1da767-491b-4077-b472-2cc3d73246d6@ama=
zon.com/
> [5]: https://lore.kernel.org/all/94d6047e-3b7c-4bc1-819c-85c16ff85abf@int=
el.com/
>
