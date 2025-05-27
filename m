Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E527F754
	for <linux-coco@lists.linux.dev>; Tue, 27 May 2025 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362438; cv=none; b=hKFP0SZeNeVXFpqZCV5xD9vPCxhenYklFO8GwBiVn1waWcQ5EDK2l7kAuAI8mNmsCSrXdIm2lSBch07Bgz2s1DyfBtso4rFuSpj6aM4VEzy66lIazjAy38cPaGbxlKEWBvhZr++ZSu/a+0gn0ObhzVCw/UEY4JP4MBnk+ML6/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362438; c=relaxed/simple;
	bh=iqiXA6Rbb03tF/HCDxpk+ZKgjSzt6H2Xax2VkzI4ddM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLjyla2BntuJNBt9TrOcx7Rw0MvT7z5e25/qkvWs8gv3grxyV0li49SIOhAY6DUCs6qCqidEua0n+OPC/109SO8S17TWaviWk3QSxZxGWJUgSJRFIdkzdicLkd9n8rzhand4yVqRztY7K4seJ+1DinQ1e/++P81ymbmXv3Xhti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gQCV/q6g; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gQCV/q6g"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3114c943367so2397212a91.1
        for <linux-coco@lists.linux.dev>; Tue, 27 May 2025 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748362436; x=1748967236; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CyI6lRGaIfXB7jxaPrJKSQO0H+oxISfyvnAekkvYBnI=;
        b=gQCV/q6guevQtfLweYHsAzvv3uy3vA0jlyVJ3f6FtQjcS14bByxNkxQumKguGWS1Ob
         g2du2lmVB6gTm4ptQjBA7h9aYOHAwkSAJVWIXozRpVo3BCuSQ9dRNj6yCUwlI6ezfyur
         lXwDhzk2OPhylVJKhly272yWux2wB2f0UzasYnd20ulFXZ92nx01+IO5UqrVpruWxVy8
         JIom3KOEKuWUiV4DJS8G3wcbUr/rgWCXlZJnA5BSQG71YJjF2o0v981KXeit6AmCk7wJ
         m3yrLHVPKUteMxOtKvkSnVxdM76rmc/TAqy65gEhWLX3tZJPqjaLRvDVQ/aN8HkWS3i0
         QSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748362436; x=1748967236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyI6lRGaIfXB7jxaPrJKSQO0H+oxISfyvnAekkvYBnI=;
        b=atRZxRvAoTWeRF8N3PMAk5EQd5EExQ/T9JYbMuydsxLq+ErgJuv9d2bK/9/tOdEu9o
         7x1leygSSW3fioS0apDOhD8KnxVTasBwf+JMTItDc9BgH9qBMgm9a9MCzsBw7TUz6qui
         luuphHzgeRanQUkX8f73DLaaXCWTPGTvEzDaLXZQDoah09Y3Che5Rd0ZM7ghLGxXNEdn
         p7jRVKoVvkqsiCxEOX+F2K3vlBNKWbtX05gC5d3J/rAKeI3raGxx3E7ycnO2vSepCX2t
         0lVzt2kYDzgt1FgSeV/lY3QJ50MiLQyEhMxeCCTLrr2QBF9KXSxVxbPwTgKH56BpRgmR
         lyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdl3fp2fyfEhfvqv5fVGnafU0+uvlOAusr5VIJecRNhntqsaul2ErGh9IQy/lW4lHvlT6NgO52qjfT@lists.linux.dev
X-Gm-Message-State: AOJu0YwXVvJCLyII/xbopav3CjlniPCdgPG8fifbh2PIbVPDkDJnKCPS
	6jg1xv6pWMDphiWPLsIN5/O+eXEutHDw2jL3i9OZzNcf1GTVnlQc168mmNCJMC8zTw5/H7Izc1p
	qUTtf5q2+uauXq09Q3c5bcRlM1daJy9idZmegnRzu
X-Gm-Gg: ASbGncvaAyKx3Li024g4AH02YVUTVgrWytFdrFJJX/VwFbdEUrSscO8UhIreJR+phjT
	6he3QaDjMJ/ORILiiAqzDJY1RzmAoLpCwdHkHE52eKijdj9ox2Mb9UZ2iJx4lWpGGw03/Fj8+5z
	ImqEDyNp1OCiFvJ76W70mhcqPrc32dcrF093uPA4spDAj+
X-Google-Smtp-Source: AGHT+IEFXnUmQcAwZf0IdnuZbXNQFTMc5YTTUzgjQQa6keoKBAojGNaeiYVFV4H1X8znHWDrSoSoOeOR7BiDVmVBRMw=
X-Received: by 2002:a17:90b:574c:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-31110d99815mr22155423a91.35.1748362435541; Tue, 27 May 2025
 09:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250428195113.392303-1-michael.roth@amd.com> <20250428195113.392303-2-michael.roth@amd.com>
 <aC3m1uMmp28gSm3r@google.com>
In-Reply-To: <aC3m1uMmp28gSm3r@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 27 May 2025 09:13:42 -0700
X-Gm-Features: AX0GCFuVQ3lRhOu8bBMkwtNkd8VOCPOAbdPGDH93Xwsy8_b3o-5N_Qdrv4KHUx8
Message-ID: <CAAH4kHbcLkGQ4yLKOzRzW=JP5QouonneYnAMU3eqZtPKVVF_jA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, liam.merwick@oracle.com, huibo.wang@amd.com
Content-Type: text/plain; charset="UTF-8"

> Side topic, what sadist wrote the GHCB?  The "documentation" for MSG_REPORT_REQ
> is garbage like this:
>

Dude, please leave this kind of feedback in your head and treat your
collaborators with respect.



-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
