Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0028A2DC
	for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739471253; cv=none; b=C1pDmY/saFAeI0DTB+eyNEsFOHQVrM9jTFRgSJDdHb09UmrcC2OL53+lnPN0AbDaVEART1d2PdE+0WdgElcwIyAGN6T86t+UKfxS/X5gTo1fuLwHVClnbUBEXlRIHyjkg9rBqztrmydEjZxT/KaW0OwluXubjQRwDj8U6bfFAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739471253; c=relaxed/simple;
	bh=OTamoCaAELawXfHAo8Dg5hvARsTb6hnOLfo5aoNhCYA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GkmtNoU+OwTpZ0btZ3AJrWJYsm0BUzwfblkAJ7v5TIoPI1yDE1r/pMizG5hrUC6S+nEpyCyi0/dp9paMwRlwEwkiNuPCXSW3Ecw1vm0kVmm2ZQYtRu23V3iQXOP+Be0oliQWlkouZvNjwzT1ILVbarcU04nI2Mtjjwkiv9j0fbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4os7P2/Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4os7P2/Z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso14172425e9.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Feb 2025 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739471249; x=1740076049; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wO3tnbDyBPz/6modFTgL1MtKdOHsq88VgQPMmMlnBzs=;
        b=4os7P2/ZWagJ4qp2Z9FKJ3kBe6MyhFPRe7JXfBD+odp6AdrZEgoJoPMlrE7iSI/GRT
         oa17Y+NtmRmqXGkVPfpZvRw5MjLnUhtmte0lo7HqEQrcPEWGLl7hO0rfkL5pGxr9H05Q
         lF8oQNNqDOuOyubgoesa1Zvp7UVnjVoyAPBJACy0909DEGR4BxSEzJu+tlouTBkVSYbg
         HcEXOVlVm625/eqnwTbv0S+LSxxg9koarYBiAZ/anzWWC012h69IJy/+5uJoymc88/n7
         ROA8u/pLY4py+LMzFv49R8FgrY9hzfEFutFCIVt0mob2qTEVX7024MHra7GcgnIOCqGK
         XZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739471249; x=1740076049;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wO3tnbDyBPz/6modFTgL1MtKdOHsq88VgQPMmMlnBzs=;
        b=sI0XeOeI+Ji/zfXEDkYF5bUqek5tq63pCzU55Nlc7bhcEjdUd9Pazj6nbTWLrB8AKo
         Wy36jwnyWDgxMtpV5zf+Dal54nmtBF+N5pPpjndnu0wpQ/iKKi/eVwrxnGvjwMhVzORG
         CDYfgjstzdwPwveLfdbTAvP08iF8Sgfq8ugiT71OUiTMt9X982kExXkDONeluqklQA5P
         Fb7o+iSKo0EwCA2k8FsWz77d+djP+hnri14/R5etmghsPoImejesftXyIhy/ju0vKC7l
         e9PD90QXRGE+dOMDvpMRr3xW3iJkIQ37ouTSS3m7Wa0V/voAYxPDaNQcNW/CDShKx1IQ
         B0lg==
X-Gm-Message-State: AOJu0YxUrB+9768M245zcLY8Yueb2YxyuTn5Z/PU487NGLpUTwOC0mf3
	96Gn8uMxla/PAS771Gi1j9xpSRHxvAGd4BhMs/6ztQXn3yrH1iOULWlUaVwq0Jgzf9kV0J7irLR
	EqWO5xcvjD1ilz5gsvmeaHY/cs2XU3PW5aVrueulfKcUTmXzIR3GE
X-Gm-Gg: ASbGncs49aOK9CueGQveEibtZwb8rxoha/cU8VorNspb/RYfn2C98B8Wp+kpOXDbu8C
	+rZIeU+InUM/0qDPmalJM1YJXh16UhfVCVIvXLl8U9F7TdvRJwT1hflwJ2TnnP2qFEpc8NN0gQQ
	==
X-Google-Smtp-Source: AGHT+IElysB8VpXCH9BwL/hl0wJJgdK2ls7RDpvAEBIPAbpedQW0fqw8L1z0uwwNzyN+r1egI4jVD4G8tJVcT6pHGOY=
X-Received: by 2002:a05:600c:6986:b0:439:4700:9eba with SMTP id
 5b1f17b1804b1-43960185ed6mr61641925e9.2.1739471248731; Thu, 13 Feb 2025
 10:27:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Thu, 13 Feb 2025 10:26:51 -0800
X-Gm-Features: AWEUYZnqtL_OcGjQk3qg2ipecXWAVYFJWBFsOytwToG2g77cMJH0Jml8CihOzUM
Message-ID: <CABayD+f-1kTZZaKx7Okbi_eoua8uv8qa4_-XMa28CigJ58dZrw@mail.gmail.com>
Subject: Collecting Open Questions from the Linux Kernel SIG Call
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd like to aggregate a list of open questions. This list is
definitely incomplete. Please add to it!

* Should there be a standard for common protocols? (But not the
underlying interfaces, since those can not be universally shared)
* What is the correct method for capability discovery with the SVSM?
        + Do we want the SVSM to touch ACPI? (No, but what instead?)
        + Going across the common protocol seems pretty reasonable
* What SVSM capabilities are common and complex enough to warrant
further discussion?
      + Observability?
      + TPM?
* How should the shared code within Linux be organized?

Thanks,
Steve
