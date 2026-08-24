Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13AB3806C1
	for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787594302; cv=none; b=hJDrreY/hif0bVBum/1Q+hP+C65uwLaZ7cnWayzQBf9MjJzQpl3N46DTeYqV+JtDEGvNe7NXQCVcRXEuRx7aG/xOlfsPXFX3B9BFgjsk8UrbaAwmC3GwUpoH5sh3rL48lmOSbmarSdialKj2KlXKmrLc5zfjomHqEfc0NqHYObo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787594302; c=relaxed/simple;
	bh=jcX1BOXw1evMbb68xwYAb+KhNzXpTeM+avGPItf84U0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NsHAzoKiCMLjxiyaa6gA8/fIqrepKMv+rUxrE/Rk1rtfD8ylyZUnlDFmqgxWmzXM6hrw8oEHcthdnlurxarL3PVXbYu+8FZj/if+aA3SIFayUiSzlBDr2cz4y2GJefTqlWe7zQjYcUynmorvNVUcLxKc1IyZIZ7fkLq5i7h2044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tcBQWzk9; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tcBQWzk9"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso50072825ad.0
        for <linux-coco@lists.linux.dev>; Mon, 24 Aug 2026 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787594298; x=1788199098; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcX1BOXw1evMbb68xwYAb+KhNzXpTeM+avGPItf84U0=;
        b=tcBQWzk9XvvpGX2bs4LOUl6qRQwJvE38HezvA5sjmgEzf2POjal1ps1SQ8min1NE1M
         hofI+Kg4Km5jr11EDbTCNqv/5TEalmcy44qiTaNeXHEwKG9Zq9wge2yrBliHEoYlIitW
         ELGm/gXjecdtIQFIlJaAfP9RVjqPEf6jpCIrbvC7oG6BPh76n/7lBOnjbZLZ31J9q7Og
         HRvA3MGnf21agtHLMEMWYRH+btqbiry3In00rKJOmr2SIeZRJ7JUJ27DbiwLCQpYex20
         9UaDsfd+X5sAQzqnhIev7MXmeMeX82EZFN5TIYochIuxMoqy/n4EI3e7RmXFeXlbH0ag
         Ltiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787594298; x=1788199098;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcX1BOXw1evMbb68xwYAb+KhNzXpTeM+avGPItf84U0=;
        b=rjrLooYFW42LXLPT8MZAnEOoq9N9T7/cW0bW+onq4Lb7xFCChLC48vNWk/fp5kbdX4
         OSKAaXZ0QsPI2SzOHe7UwaD5Du4Cjuok42e1B7Oie3+MWWHna+f44SVRfjjadaTz9HZP
         XOKWThGG/xBtYGxyM4o3OGNwXqDIQapumzeXGDFilHwq9DJqoBawKCz/a4yi2p1ywwg3
         5tPDFL+PLZqGe4J0426hX8eRSMnCMWJ/Q3VLK6SsEwIujldE8lYpM8QAtFmKUomxa2o3
         b69CvcWzlqlSp7LTUjZU5s881waCytCXlY0Lh+181+D/KDFjVwkCqzHePEoAlLr4+isC
         m6Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrYSq6f0ijxlJvK2zELv1hbhKuyMy3omLTW1Xu+J0JPCYODfKSWwdc/9cP47aJFBZOSdFaMSJooAqkw@lists.linux.dev
X-Gm-Message-State: AFuF++mzVyr4wcIdeGb8jwKIwJf0ke7OzRLmMp3pAbgh/ILewddeHBil
	I+nbQgHc69qFR6sAZ66yhr4jJBdogEF3ZxU634yL4ZArtjuceCqWzVx/9yijQlC7QF8vLdSIPtz
	pmQc00ixwyw==
X-Received: from plbiw24.prod.google.com ([2002:a17:903:458:b0:2ca:97d5:9cac])
 (user=psalian job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c07:b0:2d5:c099:16e2
 with SMTP id d9443c01a7336-2d670d5d4bfmr364320495ad.13.1787594298184; Mon, 24
 Aug 2026 10:58:18 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:58:17 +0000
In-Reply-To: <51a316c1-4654-4f6f-92ff-84c310cd604d@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <51a316c1-4654-4f6f-92ff-84c310cd604d@amd.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260824175817.483800-1-psalian@google.com>
Subject: Re: [PATCH] fuse: mark DAX VMA page protections as decrypted
From: Punit Salian <psalian@google.com>
To: pankaj.gupta@amd.com
Cc: michael.roth@amd.com, thomas.lendacky@amd.com, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stefanha@redhat.com, vgoyal@redhat.com, linux-coco@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pankaj,

Just following up to see if you had a chance to test this patch on your working SEV-SNP setup. If everything looks good on your end, could you please share your Tested-by tag so we can get this queued up with Miklos?

Thanks,
Punit
