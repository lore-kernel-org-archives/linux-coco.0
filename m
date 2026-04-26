Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF4171AF
	for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777219875; cv=none; b=GxS45Y/aDqPTiapgM+XE/RYZGVU61zrCOz9vaeH7phPrfWaPu9k9xk0g4CQqqL3pXWp61ByhUq6U72ibVByNWy+I5l42J6qzC6N1Lpi06x4PHbVuQlM5JePGqKcHmZ00X5VvmOuDaL53dbsAigNztirLzdoOFAgnS/SaHMwSvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777219875; c=relaxed/simple;
	bh=rPe2iEWwu8TufVqs1vToRHB8DPLT+nP9Myl4+LYf/W4=;
	h=Date:From:To:Cc:Message-ID:Subject:Mime-Version:Content-Type; b=aF/zp2S+axomh2jSolabuDNs6KJ0TR2riJHERVngf+l7PIZwQBq+SzHH7mjXXFyQ3YmALbhW8yXwV6BpsjvFD960P+ZWk+kXy8Ry+nxYxO6kVoyspipQBimCqhxvVud0dLN+VvBoHCZ8v4QwyByh1YTW2A7B1AQzPYugxlKjPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUFp35U7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUFp35U7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCC9C2BCB3
	for <linux-coco@lists.linux.dev>; Sun, 26 Apr 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777219875;
	bh=rPe2iEWwu8TufVqs1vToRHB8DPLT+nP9Myl4+LYf/W4=;
	h=Date:From:To:Cc:Subject:From;
	b=aUFp35U7RDY9YlzehHpMorxFTmFd5jeeULEt2/EWY9EbVJQsYRBfgt+4UH++Q7nXr
	 8KGrDjjitHycf+Ku/AbVj/Zu9FgBibeoqnc/1HAiddIJ/ypSQJVofWW88kMtehUICc
	 qV1ifNWvuFGqnRn6OG1DcXIVUsdT7f+1IChC+KVf4H14hnCbhsNnE4QmCAkgfv0fvS
	 DiEPq5ybK2iCghIxkcpKP+I/n4M0YwFruFTOw3bvDU+pnBbxni1vnzzNvnmjtKq/gK
	 /Ygc44cDWJv6RNKTgejk+JrA4fE0wbIyCpDy9wzrl9OBnnW7v8LU9TfGwfzXZptw3B
	 jGrGfg6HsrRzw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7513AF40086;
	Sun, 26 Apr 2026 12:11:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 26 Apr 2026 12:11:14 -0400
X-ME-Sender: <xms:IjnuaeSGLYMngJlHn9rJ59UCJkP0ILkTdVZQjc1lATCsWc9zYxuBEA>
    <xme:IjnuabjKjbxMJVnrRJEc0eHt8dydHROwSk63Ngx56_gqDDoZAV-5s6sKsV5HALo5f
    NY_mqTA8-FEKaBhCb-VsjuCzHR6tnVDO4capAz9QLtelaCwXiVXWyA>
X-ME-Received: <xmr:Ijnuae4bgojbHyPnabqPXB2TS1obf0bUY-iB7xQK8GRQp1rowXAL7dbwgni46yFLtE8wLTr4yJaNBw1SnAxAnpH88068kE4GWXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejiedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhllhhi
    rghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedthf
    ethfehkeffkeeuteekueetleeiffetteeigeejveeuveevfeeludfgfefhfeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqddujeejvdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvghlrd
    horhhgsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurg
    htihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgtohgtoheslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IjnuaYA5dzIom_nTG5dHG11-2l-umwIBeQkzJglqpwX-s5Ah42VUzQ>
    <xmx:IjnuaVaFPwpLnoAahbQ8LY50NESEn5EjDJplIG2WRPiUMjLFpi3cGA>
    <xmx:IjnuaTbKTVF2R0TDUw26OeWM-klDmmHnKtMjoYiZ9dQS8USeQ2T2zw>
    <xmx:Ijnuac-qfS0lu47Af-s0H_hL70iiMloa0_foxbwmM9sAGRxZ14wMMg>
    <xmx:IjnuaSjC6xcz_vlOXJJcZA_ma_0NjWd1GBCXuOOYmcy6KLg_tXGkgDPM>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Apr 2026 12:11:13 -0400 (EDT)
Date: Sun, 26 Apr 2026 09:11:12 -0700
From: Dan Williams <djbw@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-coco@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
Subject: [GIT PULL] Trusted Security Manager (PCIe TSM) Update for 7.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.1

...to receive a small update for the TSM core. It is arguably a fix and
coming in late as I have been offline the past few weeks.

Recall that you asked for searchable help with the TLA disease last time
[1]. "PCIe TSM" turns up useful results.

The other motivation for sending this one-patch pull request is to test
that you have my key with updated email.

This has been in linux-next for a while with no reported issues.

[1]: http://lore.kernel.org/CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com

--

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.1

for you to fetch changes up to 3177779ae17db4c66c851f799505fb95c7530c03:

  virt: coco: change tsm_class to a const struct (2026-04-02 15:45:18 -0700)

----------------------------------------------------------------
tsm for 7.1

- Drop class_create() for the "tsm" class

----------------------------------------------------------------
Jori Koolstra (1):
      virt: coco: change tsm_class to a const struct

 drivers/virt/coco/tsm-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)
