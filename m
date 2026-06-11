Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D5F39FD4
	for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202332; cv=pass; b=GvOiF29LiynJ8GM/aqj9VeAoaEBcAlwI0cOzpqcNddW0zQBpRLxNhkvyJ7TpeMNUksxm6QkK+gDyYvSIc8nFmVFh+4qp5QkIz12JQhHC8m7psjYjb77V+Q7HxW88RGioC7mP/whgPDA19GFdloelllMyeaIwvqy3XJtWitoG5vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202332; c=relaxed/simple;
	bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmmrvoVMe6LUKJFOssimb2sjIg4Fqh3JIENvmbaWpGs9Jb88lNrL9h7eNQkuH02tM8EY0udzNRT8sZvhySiMAJsA0zLbzYWACp2Puv0qyhteoZFzl3+aVgn1koi2z5DZG4wcUH8F2sbCHj2ifm3PTa5wMzb4pODURMnAnKeOZjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icZ5thne; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icZ5thne"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177d1ff061so57801cf.1
        for <linux-coco@lists.linux.dev>; Thu, 11 Jun 2026 11:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781202328; cv=none;
        d=google.com; s=arc-20240605;
        b=Vs6aNJpdGZtE7D36SECY5v3wQCGxx+nS0fk8oUt5FwmuE9b8/1F6p4/9OE19s7uheM
         nh+zxgtKGZrc646c9ESy0pk6QFzrln8CUk+P0DFZPVSSiOweKyxhyeuAI42v5bl5yQ4f
         SBd+D3apw6hLzHyz37ChdLJqzkCC9gjLMUYy2lytXOZ780CwlS2bPerGIKIOo1mcXU8g
         eafT8+RgXLkiLuXrPnb0VUNYqdqFcU6E/Gbok0y2NW18g57hordtRYqrH2BeHWhDDk7O
         WekIuMiijxm6QklIdA28Y6B5AFdLqrPDg+MC6bFvGxa1VR3Po4giUMHpTVfqqayPs0v/
         W3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        fh=UZCtDN4b7g9C+x0q79uiRIhMNzyytoLbpAmYEg7MfLI=;
        b=U2VxgFlXtLtg/lzzufQo3nujREVtOqkXAar/+2Js0CgswauXJa3cEUSCsnk3SZ+4Cg
         VNxZMiwZB1BgZRLMv9Zqup8RBiw6ChcQtF4vhsDcsvUCDlygtzWdbltUS/aFjzZij3Dk
         OivXzxc9PtcJ7Hvz2LAC7sK3CaXgSi9jRkO/BJ/ec2JHxRcmwAbBewW3OmZR9cvrIjZa
         Xf6f2ACWCB6F7PEYONDcw0N2hnp9U7Ho1rtloTsKH2dLZTP6Hoj3AGpWbjct0EqM5Xl5
         32h3C8DXUx5Y2YU7ns4dZNrKdeRr+zIi8Ccbl5bgRtxCpjFxq2SbSPgXoZ/m+ecpSE+F
         bXXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781202328; x=1781807128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        b=icZ5thneqMsDw3xSZoIfWUkyo2igdnnrgqf0NgkxLQjvw6hAorJonW49AplwZdfqBi
         NUEWKwN+fu2UJzPhbb2MYnbo11h4IjYGJuBcnEhcCWzMDcBRpc4VrJo1f7PaRPun7rC0
         cK98ZpwKvG/Qs2xS8onenWdOABu6bfrcHTA1e37OVQagTV+ZKn4o7/GG69ZwBGFJs8xS
         /azndVBTwK6wnN1S0PE1MyJH515jiY7aw0VDJa8Bc1+MRHa5rqSJ7nqqWk1GtT8NUO1k
         kfgjWEQF7h1JtNaMgY8akgEhChVv8F7GJA1tiJ6w+kZR6yNRCOPT1WXlTEkR0DuCVle7
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781202328; x=1781807128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KXgna/nwfEIF7S1Yx4SAsalr5XgJDJshnViSXgFlJs=;
        b=H66naupeTqknTskvGIWpNvn0ikrBISw5YXkvAEixJh7FZoXaNr7XQnSmCj/rnlsCo0
         l8DC4uCskytAMVPPgJY/usmjmzhNCfnohTPV+a+BhIuK8JHxZfHocYNnTbKmsT38Q4M9
         QL5vPnq6Bwj18nsK3HBuVb+iDUej6/jUeD7vpgJgeRbT04PA1J/aFgpjN95qbZS99du7
         L/BR3BawBfr3LS5WfRJ36l4y3+glpO7EOw7/kl1GcOh32VRugpWh5macxW1a0zJ3guZI
         4YvN576L0w6jQcKOc7o3GKWLAC2X83z3+uMDWEM/eSLHehvXDI9zP5Oh81Fd1wjQOUHH
         0fkA==
X-Forwarded-Encrypted: i=1; AFNElJ8zs4AaBG1lqjQD19V1KcQpvKFwohYYIjl9qkmEw9iZNOHZb9lFQBnTQZL7SuXltOwd7qmFjLh1CT8Y@lists.linux.dev
X-Gm-Message-State: AOJu0YyFxVbQFwOXQNACesj05ziOSvWw1xlSheeIxyHdM2P+Q1MB9UtB
	SpJeGqNaPkzFG80/IQ7lJFitT8Wm1aEcMG3MnU+/nwKuuTSs3WsmVolHtcsoskuU/eZiQN/USv0
	1C8CYjLtOanXe324Qsf5FzakM/S6/XpZ48PGZO+38
X-Gm-Gg: Acq92OFeWsHwXDDb65A9mcsLvCsE7DbQD1fbKYW12rxUgnqbXN0+PyXu7NR6OcfBF8m
	FnyLz50AOOYEb7AilNRfSCuELV+On6PEnoPJTkAirFCMNLyu/hwb8L9Maxd1ITxjjIaUvO8L9lv
	kmkvKBqJ5sxDX/udBbRMDAR4QKHUNUmkVPOXDzybXXebl7QfXBycRdUXC4OlJCExt8aCKSx4rct
	5vHun4e/PTvEv5l2Kj4eebFsKB931nlmcppJyohLmFvCTlLmLrC38qWRrmXKwmp9KLA0d1hflwP
	DZCDQH6o9eFMcrEI6BhT9J+F17B2c38Xdp73MGZU
X-Received: by 2002:ac8:5d16:0:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-517facbda8fmr1217551cf.0.1781202327712; Thu, 11 Jun 2026
 11:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <20260526023515.288829-2-rick.p.edgecombe@intel.com>
In-Reply-To: <20260526023515.288829-2-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 11 Jun 2026 11:25:16 -0700
X-Gm-Features: AVVi8Cc_4ND7d7yx-9ajFnqcQ8evQgoIAwHtu_wkSwUVPyjfFy-YFFdjIGUufDs
Message-ID: <CAGtprH9HupUdHmLJbxk0QL=8bQ0kKNw=j_-fpvfAKTf=x7izgw@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] x86/virt/tdx: Simplify tdmr_get_pamt_sz()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:35=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> For each memory region that the TDX module might use (called TDMR), three
> separate traditional PAMT allocations are needed. One for each supported
> page size (1GB, 2MB, 4KB). These store information on each page in the
> TDMR. In Linux, they are allocated out of one physically contiguous block=
,
> in order to more efficiently use some internal TDX module book keeping
> resources. So some simple math is needed to break the single large
> allocation into three smaller allocations for each page size.
>
> There are some commonalities in the math needed to calculate the base and
> size for each smaller allocation, and so an effort was made to share logi=
c
> across the three. Unfortunately doing this turned out unnaturally torture=
d,
> with a loop iterating over the three page sizes, only to call into a
> function with cases statement for each page size. In the future Dynamic
> PAMT will add more logic that is special to the 4KB page size, making the
> benefit of the math sharing even more questionable.
>
> Three is not a very high number, so get rid of the loop and just duplicat=
e
> the small calculation three times. In doing so, setup for future Dynamic
> PAMT changes.
>
> Since the loop that iterates over it is gone, further simplify the code b=
y
> dropping the array of intermediate size and base storage. Just store the
> values to their final locations. Accept the small complication of having
> to clear tdmr->pamt_4k_base in the error path, so that tdmr_do_pamt_func(=
)
> will not try to operate on the TDMR struct when attempting to free it.
>
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
