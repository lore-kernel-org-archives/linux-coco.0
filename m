Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6413382E8;
	Fri, 27 Mar 2026 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654372; cv=none; b=Lzm0GLQojDHr0inf4OSqV9O2HZprcW9YtdNRs5v6PNk/VcW1nSQ3Dmeb881hntw+UGGs+uy1e6jY+XNARwI+suzQJHzeC+aTosI9iXbF6kgFCXXP5UlfFflXlmMhIXdifo/kkPpiSxzpRCNLD27Apzut9ktI2WEb1Jnz4y61FcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654372; c=relaxed/simple;
	bh=OJlNo0dyP1+n4VkotyuFFz+KHBLE1WOw4rmt2Evpizo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bBDFY/vZeRS02XId3uFt6LvTZMnu9lr3g5CxK7j7KMU1PVp48nfDBlqf0kriRA/Dx7newStjOjWVZg3O1DbHUq0ecl2SimTb/ezNL9PHrqTU8lqoPibUuusNZuXVv/ycoPwM2bgBparI9qf0X9Vao/otNJ6k3qPNTDvFjmr4a4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0wBflrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0wBflrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFE9C19423;
	Fri, 27 Mar 2026 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774654372;
	bh=OJlNo0dyP1+n4VkotyuFFz+KHBLE1WOw4rmt2Evpizo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=G0wBflrM47+MT00Bfu3kTBlgprSUvTTbzPiCPNjkoLr8P5a3NcQHLBTOeHgl5olki
	 iUnrngtUT9qiTJ+Ob7MbsX1+tnP6mo+cMmNgfgIqi/FlC0jtwahqQqEdleXexO1NX4
	 wlZB0S92/FEhsHb+gE2TjbMh1wiVb7p9unzGpd2p7Dfg8JEBEBVUC/9LWqstySzELo
	 DKd/yGAAk5p/AKVPNtc8uYB8fG3rWcu9AEADfAPE3NQrSwzWOvdsf1VYQGUiaK+UJS
	 vO0Yr5a+h/AobWYRhFQO5pIaZWQ0hEx6ExWNTTTiwKq99DqlB4O9HFAT1EjglCbqkN
	 XkeKoNyTLHSOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA21239301F5;
	Fri, 27 Mar 2026 23:32:39 +0000 (UTC)
Subject: Re: [GIT PULL] Confidential Computing: Attestation fixes for 7.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <69c6eea861b3a_1b0cc610021@dwillia2-mobl4.notmuch>
References: <69c6eea861b3a_1b0cc610021@dwillia2-mobl4.notmuch>
X-PR-Tracked-List-Id: <linux-coco.lists.linux.dev>
X-PR-Tracked-Message-Id: <69c6eea861b3a_1b0cc610021@dwillia2-mobl4.notmuch>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-fixes-7.0-rc6
X-PR-Tracked-Commit-Id: c3fd16c3b98ed726294feab2f94f876290bf7b61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd09eb443372f9390d36051d86ebe06e9919aeec
Message-Id: <177465435827.4116696.17551036407808408352.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2026 23:32:38 +0000
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-coco@lists.linux.dev, Zubin Mithra <zsm@google.com>, Kiryl
 Shutsemau <kas@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Mikko
 Ylinen <mikko.ylinen@linux.intel.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 27 Mar 2026 13:55:04 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-fixes-7.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd09eb443372f9390d36051d86ebe06e9919aeec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
