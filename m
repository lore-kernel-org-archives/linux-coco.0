Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2482C85D
	for <linux-coco@lists.linux.dev>; Tue, 14 May 2024 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715677595; cv=none; b=odd/0CvbJ1bEpKVLVfC8YZzAHiBIdw5o3BIXjfHB5T9IwwdMn6SKgFUKBbG12TU1E+Qal+BTjY0lfIDOLI465wnig3F+fjt+C+cXECZqNJ8g2jmZ2fS3FYm7JgsdcSq7nu9x20FUaZXmNPZ3ATN6kDzzGfhqsum50Rs9ymmoseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715677595; c=relaxed/simple;
	bh=/F1+7f96DUMrbLplHAlgXpAR/dHRJqwDrlFmVjt5TVI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfpLktsduwwQND33UpzKVcjnMuCEyI6AGwbNJXCzKhRTIjiu1g09uZEqQdrYr8VKaoAo21BEac1SMfCDPVYyhbAXP3vGtywVYH8WZ74ro/a8WbfsvykIvLEJ9+BcTy1nVUn5atUry5zQZAIXdE4EKAWnmf2ogcJDf5mQTnE3Ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=ZUNku1eD; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="ZUNku1eD"
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 856561C0BB7;
	Tue, 14 May 2024 11:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1715677586;
	bh=/F1+7f96DUMrbLplHAlgXpAR/dHRJqwDrlFmVjt5TVI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ZUNku1eD1YR4LVnxWfVG8PzOjRwKnrTIgy+j6ZpvHYVXcg0VqnQGO9PZ1CX1v265H
	 bN23K4oe1c0Fb7K2FOxyQsOYxzGeRYtO2Z+HH9OpTJ9u9CCPb6lCfjjlrBOqtEldUf
	 TqFVLX96uBXow2FUvRfJey3TbaJKJohkdAnDAjaBlcPfWHG6ck1n5OXuvRRCrPk/VC
	 LLmMdEaeS3ECDIZoZ9bdNso2F5KI033ChIo2lQiQNQWEX/9QL9xLrGfWC3e/58HbXY
	 fv7eIBN5RCqid+0Ek/75meO0XIsspOrQWCZ+951s7uBn9Ckrt1h+2Mf0UDRZ/M7CQG
	 vslgvKEqksdTQ==
Date: Tue, 14 May 2024 11:06:25 +0200
From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
To: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Subject: Re: [svsm-devel] Development Plan Document
Message-ID: <ZkMpkfepqUWfq1RY@8bytes.org>
References: <Zj30Nqq3OS58DwpP@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj30Nqq3OS58DwpP@8bytes.org>

On Fri, May 10, 2024 at 12:17:26PM +0200, Jörg Rödel wrote:
> The document is on GitHub in Markdown and PDF format:
> 
> 	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.md
> 
> 	https://github.com/joergroedel/svsm-governance/blob/dev-plan/draft-development-plan.pdf

FYI, I just updated the documents with a new added section about
proposed core code work items. There are three new items there and I
moved two over from the Sec section.

Regards,

	Joerg
